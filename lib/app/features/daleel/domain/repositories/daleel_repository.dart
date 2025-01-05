// ignore_for_file: unused_field

import 'dart:developer';

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/core/models/reactive_repository.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar_source.dart';
import 'package:athar/app/features/daleel/data/sources/remote/daleel_firestore_source.dart';
import 'package:athar/app/features/daleel/data/sources/remote/daleel_fm.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:dartx/dartx.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelRepository extends ReactiveRepository<Daleel, DaleelFM, DaleelIsar> {
  final DaleelIsarSource _localSource;
  final DaleelFirestoreSource _remoteSource;

  DaleelRepository(super.authRepository, this._remoteSource, this._localSource)
      : super(localSource: _localSource, remoteSource: _remoteSource);

  Future<EitherException<void>> saveHadith({
    required String text,
    required String sayer,
    required Priority priority,
    required String extraction,
    required List<String> tags,
    required String description,
    required HadithAuthenticity? authenticity,
  }) async {
    try {
      await _remoteSource.saveHadith(
        text: text,
        tags: tags,
        priority: priority,
        authenticity: authenticity,
        userId: authRepository.user!.id,
        sayer: sayer.isBlank ? null : sayer,
        extraction: extraction.isBlank ? null : extraction,
        description: description.isBlank ? null : description,
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e as GenericException);
    }
  }

  Future<EitherException<void>> saveAthar({
    required String text,
    required String sayer,
    required Priority priority,
    required List<String> tags,
    required String description,
  }) async {
    try {
      await _remoteSource.saveAthar(
        text: text,
        tags: tags,
        priority: priority,
        userId: authRepository.user!.id,
        sayer: sayer.isBlank ? null : sayer,
        description: description.isBlank ? null : description,
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e as GenericException);
    }
  }

  Future<EitherException<void>> saveAya({
    required String text,
    required String ayaExplain,
    required String surahOfAya,
    required String nomOfAya,
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<String> tags,
    String? sayer,
  }) async {
    try {
      await _remoteSource.saveAya(
        text: text,
        userId: authRepository.user!.id,
        sayer: sayer,
        priority: priority,
        tags: tags,
        surahOfAya: surahOfAya,
        nomOfAya: nomOfAya,
        ayaExplain: ayaExplain,
        lastRevisedAt: lastRevisedAt,
      );
      return right(null);
    } catch (e) {
      return left(e as GenericException);
    }
  }
}
