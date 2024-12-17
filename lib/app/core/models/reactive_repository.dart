// ignore_for_file: inference_failure_on_untyped_parameter

import 'dart:async';

import 'package:athar/app/core/enums/status.dart';
import 'package:athar/app/core/firestore/reactive_firestore_source.dart';
import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/subjects.dart';

abstract base class ReactiveRepository<D, R extends RemoteModel<D>,
    C extends CacheModel<D>> {
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

  late BehaviorSubject<Status<List<D>>> _subject;

  void _createSubject() =>
      _subject = BehaviorSubject<Status<List<D>>>.seeded(Initial<List<D>>());

  void _closeSubject() {
    if (_subject.isClosed) return;
    _subject.close();
  }

  Stream<Status<List<D>>> getUpdates() => _subject.asBroadcastStream();

  @protected
  Future<void> toBeAwaited() => Future.value();

  void _init() {
    authRepository.getUpdates().listen((user) async {
      if (user?.id != null) {
        unawaited(remoteSource.cancelRemoteSub());
        unawaited(localSource.clear());
        _closeSubject();
        return;
      }
      if (_subject.isClosed) _createSubject();
      _subject.add(const Loading());
      await toBeAwaited();
      remoteSource.subToRemote(user!);
      remoteSource.listToBeUpdated.listen(
        (remoteModels) async {
          final domainModels = remoteModels.map((e) => e.toDomain()).toList();
          await localSource.putAll(domainModels);
          _subject.add(Success(domainModels));
        },
        onError: (e) {
          if ((e as GenericException).code == 'is_from_cache') {
            _subject.add(const Success([]));
            return;
          }
          _subject.add(Failure(e));
        },
      );
    });
  }

  @protected
  void dispose() {
    remoteSource.dispose();
    _closeSubject();
  }
}
