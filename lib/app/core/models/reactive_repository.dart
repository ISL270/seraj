// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

/// An abstract reactive repository that synchronizes data between remote and local sources
///
/// This generic class provides a comprehensive data management strategy:
/// - Handles authentication-based data synchronization
/// - Manages remote (Firestore) and local (Isar) data sources
/// - Provides a reactive stream of data with status updates
///
/// [D] represents the Domain model type
/// [R] represents the Remote model type, which must extend [RemoteModel<D>]
/// [C] represents the Cache model type, which must extend [CacheModel<D>]
///
/// For a visual representation check -> https://shrktna.atlassian.net/wiki/spaces/CA/whiteboard/36896771?atl_f=PAGETREE
abstract class ReactiveRepository<D, R extends RemoteModel<D>, C extends CacheModel<D>> {
  @protected
  final AuthRepository authRepository;
  @protected
  final ReactiveFirestoreSource<R> remoteSource;
  @protected
  final IsarSource<D, C> localSource;

  ReactiveRepository(
    this.authRepository, {
    required this.remoteSource,
    required this.localSource,
  }) {
    // Sets up initial data synchronization and stream management
    _createSubject();
    _init();
  }

  /// Behavior subject to manage and broadcast data status
  late BehaviorSubject<Status<List<D>>> _subject;

  /// Creates a new behavior subject with an initial state
  void _createSubject() => _subject = BehaviorSubject<Status<List<D>>>.seeded(Initial<List<D>>());

  /// Provides a broadcast stream of data status updates
  ///
  /// Allows multiple listeners to receive data synchronization updates
  Stream<Status<List<D>>> getUpdates() => _subject.asBroadcastStream();

  /// Optional method for additional initialization logic
  ///
  /// Can be overridden by subclasses to add custom initialization steps
  @protected
  Future<void> toBeAwaited() => Future.value();

  /// Initializes data synchronization based on user authentication
  ///
  /// Handles:
  /// - User authentication state changes
  /// - Remote data subscription
  /// - Local data caching
  /// - Status updates
  void _init() {
    authRepository.getUpdates().listen((user) async {
      // Clear data if user signs out and abandon the process
      if (user == null) {
        unawaited(remoteSource.cancelRemoteSub());
        unawaited(localSource.clear());
        _closeSubject();
        return;
      }

      // Reinitialize subject if closed
      if (_subject.isClosed) _createSubject();

      _subject.add(const Loading());

      await toBeAwaited();

      // Subscribe to remote data source
      remoteSource.subToRemote(user);

      // Listen to remote data updates
      remoteSource.listToBeUpdated.listen(
        (remoteModels) async {
          final domainModels = remoteModels.map((e) => e.toDomain()).toList();
          await localSource.putAll(domainModels);
          _subject.add(Success(domainModels));
        },
        onError: (e) {
          // Ignore cache-related errors
          if ((e as GenericException).code == 'is_from_cache') {
            _subject.add(const Success([]));
            return;
          }
          _subject.add(Failure(e));
        },
      );
    });
  }

  /// Closes the existing subject if it's open
  void _closeSubject() {
    if (_subject.isClosed) return;
    _subject.close();
  }

  /// Disposes of repository resources
  ///
  /// Closes remote source and subject to prevent memory leaks
  @protected
  void dispose() {
    remoteSource.dispose();
    _closeSubject();
  }
}
