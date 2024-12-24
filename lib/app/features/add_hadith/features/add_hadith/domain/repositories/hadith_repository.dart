// ignore_for_file: unused_field

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/data/datasources/local/hadith_isar.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/data/datasources/local/hadith_isar_source.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/data/datasources/remote/hadith_firestore_source.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/data/models/hadith_model.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/domain/models/hadith_type.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
final class HadithRepository extends ReactiveRepository<HadithModel, HadithFM, HadithIsar> {
  final HadithFirestoreSource _remoteSource;
  final HadithIsarSource _localSource;
  final HadithRepository _hadithRepository;

  HadithRepository(
    super.authRepository,
    this._remoteSource,
    this._localSource,
    this._hadithRepository,
  ) : super(localSource: _localSource, remoteSource: _remoteSource);

  @override
  Future<void> toBeAwaited() =>
      _hadithRepository.getUpdates().takeWhileInclusive((status) => !status.isSuccess).last;

  Future<EitherException<void>> saveHadith({
    required String textOfHadith,
    required HadithAuthenticity hadithType,
    required String? isnadOfHadith,
    required String? sourceOfHadith,
    required String? hadithExplain,
  }) async {
    try {
      await _remoteSource.saveHadith(
        id: authRepository.user!.id,
        textOfHadith: textOfHadith,
        hadithType: hadithType,
        isnadOfHadith: isnadOfHadith,
        sourceOfHadith: sourceOfHadith,
        hadithExplain: hadithExplain,
      );
      return right(null);
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
