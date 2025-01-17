// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_firestore_source.dart';
import 'package:athar/app/features/authentication/domain/models/auth_state.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

/// An abstract reactive repository that manages synchronization between
/// remote (Firestore) and local (Isar) data sources.
///
/// This generic class provides a robust mechanism for:
/// - Handling authentication-based data synchronization
/// - Managing real-time updates from remote sources
/// - Caching and local storage of domain models
/// - Tracking data synchronization status
///
/// Key Generic Type Parameters:
/// - [D]: Domain model type
/// - [R]: Remote model type (implements RemoteModel<D>)
/// - [C]: Cache model type (implements CacheModel<D>)
///
/// Main Features:
/// - Automatic data synchronization on authentication changes
/// - Status tracking (Initial, Loading, Success, Failure)
/// - Selective data updates for authorized users
/// - Error handling and cache management
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
    _createSubject();
    _init();
  }

  /// Behavior subject to manage and broadcast data status
  late BehaviorSubject<VoidStatus> _subject;

  void _createSubject() => _subject = BehaviorSubject<VoidStatus>.seeded(const Initial());

  /// Provides a broadcast stream of data status updates
  ///
  /// Allows multiple listeners to receive data synchronization updates
  Stream<VoidStatus> stream() => _subject.asBroadcastStream();

  @protected
  Future<void> toBeAwaited() => Future.value();

  /// Initializes the repository's data synchronization mechanism
  ///
  /// Core responsibilities:
  /// 1. Listen to authentication state changes
  /// 2. Manage remote and local data sources
  /// 3. Handle data synchronization and status updates
  void _init() {
    authRepository.stream().listen((authState) async {
      // Clear data and close subject for unauthenticated users
      if (authState.isUnauthenticated) {
        unawaited(remoteSource.cancelRemoteSub());
        unawaited(localSource.clear());
        _closeSubject();
        return;
      }

      // Recreate subject if closed
      if (_subject.isClosed) _createSubject();

      // Indicate loading state
      _subject.add(_subject.value.toLoading());

      // Waits for any external tasks to complete
      await toBeAwaited();

      // Subscribe to remote data source
      remoteSource.subToRemote(authState as Authenticated);

      // Listen to remote updates and synchronize local data
      remoteSource.listToBeUpdated.listen(
        (remoteModels) async {
          // Convert remote models to domain models
          final domainModels = remoteModels.map((e) => e.toDomain()).toList();

          // Update local storage
          await localSource.putAll(domainModels);

          // Mark synchronization as successful
          _subject.add(_subject.value.toSuccess(null));
        },
        onError: (e) {
          // Ignore cache-related errors
          if ((e as GenericException).code == 'is_from_cache') {
            _subject.add(_subject.value.toSuccess(null));
            return;
          }
          _subject.add(_subject.value.toFailure(e));
        },
      );
    });
  }

  Future<void> deleteDoc(String docID) => remoteSource.deleteDoc(
        uid: authRepository.user!.id,
        docID: docID,
      );

  /// Watches an object in the local source by its ID and maps it to a domain model.
  Stream<D?> watchLocalObject(String id) => localSource.watchObject(id).map((cm) => cm?.toDomain());

  /// Closes the status subject if it's open
  void _closeSubject() {
    if (_subject.isClosed) return;
    _subject.close();
  }

  /// Disposes of repository resources
  ///
  /// Responsibilities:
  /// - Cancel remote subscriptions
  /// - Close status subject
  @protected
  void dispose() {
    remoteSource.cancelRemoteSub();
    _closeSubject();
  }
}
