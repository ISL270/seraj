import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar_source.dart';
import 'package:athar/app/features/daleel/data/sources/remote/daleel_firestore_source.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelRepository {
  final DaleelIsarSource _localSource;
  final DaleelFirestoreSource _remoteSource;

  DaleelRepository(this._localSource, this._remoteSource);

  Future<Daleel?> getDaleelLocal() async {
    final daleelCM = await _localSource.getSavedDaleel();
    return daleelCM?.toDomain();
  }

  Future<void> saveDaleelLocally(Daleel daleel) => _localSource.saveDaleel(daleel);

  Future<void> deleteDaleelLocally() => _localSource.deleteSavedDaleel();

  Future<Either<GenericException, Daleel>> getDaleelRemote({
    required String daleelId,
  }) async {
    try {
      final daleelRM = await _remoteSource.getDaleelInfo(daleelId);
      return right(daleelRM.toDomain());
    } catch (e) {
      return left(e as GenericException);
    }
  }

  Future<Either<GenericException, Daleel>> saveDaleelInfoRemote({
    required DaleelType daleelType,
    required String daleelId,
    required String text,
    required String rawi,
    required String extraction,
    required HadithAuthenticity hadithAuthenticity,
    required DateTime lastRevisedAt,
    required Priority priority,
    required List<String> tags,
  }) async {
    try {
      final daleelRM = await _remoteSource.saveDaleelInfo(
        daleelType,
        daleelId: daleelId,
        text: text,
        rawi: rawi,
        extraction: extraction,
        hadithAuthenticity: hadithAuthenticity,
        lastRevisedAt: lastRevisedAt,
        priority: priority,
        tags: tags,
      );
      return right(daleelRM.toDomain());
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
