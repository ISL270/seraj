// ignore_for_file: unused_field

import 'dart:developer';

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/daleel/data/models/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/data/models/remote/daleel_fm.dart';
import 'package:athar/app/features/daleel/data/sources/daleel_firestore_source.dart';
import 'package:athar/app/features/daleel/data/sources/daleel_isar_source.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelRepository extends ReactiveRepository<Daleel, DaleelFM, DaleelIsar> {
  final DaleelFirestoreSource _remoteSource;
  final DaleelIsarSource _localSource;

  DaleelRepository(super.authRepository, this._remoteSource, this._localSource)
      : super(localSource: _localSource, remoteSource: _remoteSource);

  Future<EitherException<void>> saveHadith({
    required String text,
    required String sayer,
    required String description,
    required HadithAuthenticity authenticity,
    required Priority priority,
    required String extraction,
    required DateTime lastRevisedAt,
    required List<String> tags,
  }) async {
    try {
      await _remoteSource.saveHadith(
        userId: authRepository.user!.id,
        text: text,
        sayer: sayer,
        description: description,
        extraction: extraction,
        hadithAuthenticity: authenticity,
        lastRevisedAt: lastRevisedAt,
        priority: priority,
        tags: tags,
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e as GenericException);
    }
  }
}
