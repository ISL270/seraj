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
        sayer: sayer,
        priority: priority,
        extraction: extraction,
        description: description,
        authenticity: authenticity,
        userId: authRepository.user!.id,
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
}
