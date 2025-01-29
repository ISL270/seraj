// ignore_for_file: unused_field

import 'dart:developer';

import 'package:athar/app/core/models/generic_exception.dart';
import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar_source.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelRepository extends Repository<Daleel, DaleelIsar> {
  final DaleelIsarSource _localSource;

  DaleelRepository(this._localSource) : super(_localSource);

  Future<Either<Exception, void>> saveHadith({
    required String text,
    required String sayer,
    required Priority priority,
    required String extraction,
    required List<Tag> tags,
    required String description,
    required HadithAuthenticity? authenticity,
  }) async {
    try {
      final daleelIsar = DaleelIsar(
        text: text,
        sayer: sayer,
        priority: priority,
        daleelType: DaleelType.hadith,
        description: description,
        lastRevisedAt: DateTime.now(),
        hadithExtraction: extraction,
        hadithAuthenticity: authenticity,
      );
      _localSource.put(daleelIsar);
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e as GenericException);
    }
  }

  Future<Either<Exception, void>> saveAthar({
    required String text,
    required String sayer,
    required Priority priority,
    required List<Tag> tags,
    required String description,
  }) async {
    try {
      final daleelIsar = DaleelIsar(
        text: text,
        sayer: sayer.isEmpty ? null : sayer,
        priority: priority,
        daleelType: DaleelType.athar,
        description: description.isEmpty ? null : description,
        lastRevisedAt: DateTime.now(),
      );
      _localSource.put(daleelIsar);
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e as GenericException);
    }
  }

  Future<Either<Exception, void>> saveAya({
    required String text,
    required String ayaExplain,
    required String surahOfAya,
    required int firstAya,
    required int lastAya,
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<Tag> tags,
    String? sayer,
  }) async {
    try {
      final daleelIsar = DaleelIsar(
        text: text,
        sayer: sayer,
        priority: priority,
        daleelType: DaleelType.aya,
        description: ayaExplain,
        lastRevisedAt: lastRevisedAt,
        surah: surahOfAya,
        firstAya: firstAya,
        lastAya: lastAya,
      );
      _localSource.put(daleelIsar);
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(e as GenericException);
    }
  }

  Future<bool> isAyahExist({required String surahName, required int ayahNumber}) async {
    return await _localSource.getAyaByText(surahName: surahName, ayahNumber: ayahNumber) != null;
  }

  Future<Either<Exception, void>> saveOthers({
    required String text,
    required String sayer,
    required String description,
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<Tag> tags,
  }) async {
    try {
      final daleelIsar = DaleelIsar(
        text: text,
        sayer: sayer.isEmpty ? null : sayer,
        priority: priority,
        daleelType: DaleelType.other,
        description: description.isEmpty ? null : description,
        lastRevisedAt: lastRevisedAt,
      );
      _localSource.put(daleelIsar);
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
    final cms = _localSource.getDaleels(
      searchTerm,
      page: page,
      // filters: filters,
      pageSize: pageSize,
    );

    return cms.map((e) => e.toDomain()).toList();
  }

  @override
  DaleelIsar fromDomain(Daleel dm) => DaleelIsar.fromDomain(dm);
}
