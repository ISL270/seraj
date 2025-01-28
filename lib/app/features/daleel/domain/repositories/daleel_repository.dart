// ignore_for_file: unused_field

import 'dart:developer';

import 'package:athar/app/core/models/domain/generic_exception.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar_source.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelRepository {
  final DaleelIsarSource _localSource;

  DaleelRepository(this._localSource);

  Future<Either<Exception, void>> saveHadith({
    required String text,
    required String sayer,
    required Priority priority,
    required String extraction,
    required List<String> tags,
    required String description,
    required HadithAuthenticity? authenticity,
  }) async {
    try {
      await _localSource.saveHadith(
        text: text,
        tags: tags,
        priority: priority,
        authenticity: authenticity,
        sayer: sayer.isEmpty ? null : sayer,
        extraction: extraction.isEmpty ? null : extraction,
        description: description.isEmpty ? null : description,
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
      await _localSource.saveAthar(
        text: text,
        tags: tags,
        priority: priority,
        sayer: sayer.isEmpty ? null : sayer,
        description: description.isEmpty ? null : description,
        lastRevisedAt: DateTime.now(),
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
    required int firstAya,
    required int lastAya,
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<String> tags,
    String? sayer,
  }) async {
    try {
      await _localSource.saveAya(
        text: text,
        sayer: sayer,
        priority: priority,
        tags: tags,
        surahOfAya: surahOfAya,
        firstAya: firstAya,
        lastAya: lastAya,
        ayaExplain: ayaExplain,
        lastRevisedAt: lastRevisedAt,
      );
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e as GenericException);
    }
  }

  Future<bool> isAyahExist({required String surahName, required int ayahNumber}) async {
    return await _localSource.getAyaByText(surahName: surahName, ayahNumber: ayahNumber) != null;
  }

  Future<EitherException<void>> saveOthers({
    required String text,
    required String sayer,
    required String description,
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<String> tags,
  }) async {
    try {
      await _localSource.saveOthers(
        text: text,
        sayer: sayer,
        description: description,
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

  Future<List<Daleel>> searchDaleel(
    String searchTerm, {
    required int page,
    required int pageSize,
    DaleelFilters? filters,
  }) async {
    final cms = await _localSource.getDaleels(
      searchTerm,
      page: page,
      filters: filters,
      pageSize: pageSize,
    );

    return cms.map((e) => e.toDomain()).toList();
  }
}
