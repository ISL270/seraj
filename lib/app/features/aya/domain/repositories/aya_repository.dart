import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/aya/data/datasources/local/aya_isar.dart';
import 'package:athar/app/features/aya/data/datasources/local/aya_isar_source.dart';
import 'package:athar/app/features/aya/data/datasources/remote/aya_firestore_source.dart';
import 'package:athar/app/features/aya/domain/models/aya_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class AyaRepository extends ReactiveRepository<AyaModel, AyaFm, AyaIsar> {
  final AyaFirestoreSource _remoteSource;
  final AyaIsarSource _localSource;

  AyaRepository(
    super.authRepository,
    this._remoteSource,
    this._localSource,
  ) : super(localSource: _localSource, remoteSource: _remoteSource);

  Future<EitherException<void>> saveAya({required AyaModel ayaModel}) async {
    try {
      await _remoteSource.addAya(
          ayaFm: AyaFm(
        textOfAya: ayaModel.textOfAya,
        surahOfAya: ayaModel.surahOfAya,
        nomOfAya: ayaModel.nomOfAya,
        ayaExplain: ayaModel.ayaExplain,
      ));

      return right(null);
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
