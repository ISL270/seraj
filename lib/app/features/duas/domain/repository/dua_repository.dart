// ignore_for_file: unused_field

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/duas/data/model/local/dua_isar.dart';
import 'package:athar/app/features/duas/data/sources/local/dua_isar_source.dart';
import 'package:athar/app/features/duas/data/sources/remote/dua_firestore_source.dart';
import 'package:athar/app/features/duas/domain/model/dua.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaRepository extends ReactiveRepository<Dua, DuaFM, DuaIsar> {
  final DuaFirestoreSource _remoteSource;
  final DuaIsarSource _localSource;

  DuaRepository(
    super.authRepository,
    this._remoteSource,
    this._localSource,
  ) : super(localSource: _localSource, remoteSource: _remoteSource);

  Future<EitherException<void>> addDua({
    required String text,
    required String? reward,
    required Priority priority,
    required List<String> tags,
    required String? description,
  }) async {
    try {
      await _remoteSource.addDua(
        text: text,
        tags: tags,
        reward: reward,
        priority: priority,
        description: description,
      );
      return right(null);
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
