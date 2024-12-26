import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/add_aya/data/datasources/local/aya_isar.dart';
import 'package:athar/app/features/add_aya/data/datasources/local/aya_isar_source.dart';
import 'package:athar/app/features/add_aya/data/datasources/remote/aya_firestore_source.dart';
import 'package:athar/app/features/add_aya/data/models/aya_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

@singleton
final class AyaRepository extends ReactiveRepository<AyaModel, AyaFm, AyaIsar> {
  final AyaFirestoreSource _remoteSource;
  final AyaIsarSource _localSource;

  AyaRepository(
    super.authRepository,
    this._remoteSource,
    this._localSource,
  ) : super(localSource: _localSource, remoteSource: _remoteSource);

  @override
  Future<void> toBeAwaited() =>
      getUpdates().takeWhileInclusive((status) => !status.isSuccess).last;

  Future<EitherException<void>> saveAya({required AyaModel ayaModel}) async {
    final ayaID = const Uuid().v4();

    try {
      await _remoteSource.addAya(
          ayaFm: AyaFm(
        id: ayaID,
        textOfAya: ayaModel.textOfAya,
        surahOfAya: ayaModel.surahOfAya,
        nomOfAya: ayaModel.nomOfAya,
      ));
      // await _localSource.putAya(AyaIsar(
      //   id: ayaID,
      //   textOfAya: ayaModel.textOfAya,
      //   surahOfAya: ayaModel.surahOfAya,
      //   nomOfAya: ayaModel.nomOfAya,
      // ));
      return right(null);
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
