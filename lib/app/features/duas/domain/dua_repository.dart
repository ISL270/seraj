import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/duas/data/data_source/local/aya_isar_source.dart';
import 'package:athar/app/features/duas/data/data_source/local/dua_isar.dart';
import 'package:athar/app/features/duas/data/data_source/remote/dua_firestore_source.dart';
import 'package:athar/app/features/duas/data/model/dua.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaRepository extends ReactiveRepository<Dua, DuaFm, DuaIsar> {
  final DuaFirestoreSource _remoteSource;
  final DuaIsarSource _localSource;

  DuaRepository(
    super.authRepository,
    this._remoteSource,
    this._localSource,
  ) : super(localSource: _localSource, remoteSource: _remoteSource);

  Future<EitherException<void>> saveDua({required Dua dua}) async {
    try {
      await _remoteSource.addDua(
          duaFm: DuaFm(
        textOfDua: dua.textOfDua,
        explanation: dua.explanation,
        numOfRepeat: dua.numOfRepeat,
        priority: dua.priority,
        reward: dua.reward,
      ));

      return right(null);
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
