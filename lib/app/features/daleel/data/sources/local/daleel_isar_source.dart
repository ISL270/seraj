import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class DaleelIsarSource extends IsarSource<Daleel, DaleelIsar> {
  const DaleelIsarSource(super.isarService);

  /// Converts a domain model into its corresponding cache model
  @override
  DaleelIsar fromDomain(Daleel dm) => DaleelIsar.fromDomain(dm);

  /// Fetches a list of Daleel items with optional filters
  Future<List<DaleelIsar>> getDaleels(
    String searchTerm, {
    required int page,
    required int pageSize,
    DaleelFilters? filters,
  }) async {
    final query = searchTerm.isNotBlank
        ? isarService.db.daleelIsars.where().textStartsWith(searchTerm).filter()
        : isarService.db.daleelIsars.where().anyText().filter();

    return query
        .optional(
          filters?.daleelType.isNotEmpty ?? false,
          (dl) => dl.anyOf(
            filters!.daleelType,
            (q, type) => q.daleelTypeEqualTo(type),
          ),
        )
        .optional(
          filters?.priority.isNotEmpty ?? false,
          (dl) => dl.anyOf(
            filters!.priority,
            (q, priority) => q.priorityEqualTo(priority),
          ),
        )
        .optional(
          filters?.date.isNotEmpty ?? false,
          (dl) => dl.anyOf(
            filters!.date,
            (q, date) => q.lastRevisedAtEqualTo(date),
          ),
        )
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }

  /// Fetches a single Ayah record by Surah name and Ayah number
  Future<Aya?> getAyaByText({required String surahName, required int ayahNumber}) async {
    try {
      final daleelIsars = await isarService.getAll<DaleelIsar>();
      final matchingDaleels = daleelIsars.where(
        (daleel) =>
            daleel.daleelType == DaleelType.aya &&
            daleel.surah == surahName &&
            daleel.firstAya == ayahNumber,
      );
      if (matchingDaleels.isNotEmpty) {
        return matchingDaleels.first.toDomain() as Aya?;
      }
      return null;
    } catch (e) {
      debugPrint('Error fetching Aya: $e');
      return null;
    }
  }

  /// Save Hadith to the local database
  Future<int> saveHadith({
    required String text,
    required String? sayer,
    required Priority priority,
    required String? extraction,
    required List<String> tags,
    required String? description,
    required HadithAuthenticity? authenticity,
  }) {
    final hadith = Hadith(
        id: '',
        text: text,
        lastRevisedAt: DateTime.now(),
        sayer: sayer,
        priority: priority,
        extraction: extraction,
        tags: tags,
        authenticity: authenticity,
        daleelType: DaleelType.hadith);
    return put(hadith);
  }

  /// Save Ayah to the local database
  Future<int> saveAya({
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<String> tags,
    required String text,
    required String? sayer,
    required String? ayaExplain,
    required String surahOfAya,
    required int firstAya,
    int? lastAya,
  }) {
    final aya = Aya(
      id: '',
      text: text,
      sayer: sayer,
      description: ayaExplain,
      lastRevisedAt: lastRevisedAt,
      surah: surahOfAya,
      firstAya: firstAya,
      lastAya: lastAya,
      priority: priority,
      tags: tags,
      daleelType: DaleelType.aya,
    );
    return put(aya);
  }

  Future<int> saveAthar({
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<String> tags,
    required String text,
    String? sayer,
    String? description,
    DaleelType type = DaleelType.other,
  }) {
    final otherDaleel = Athar(
      id: '',
      text: text,
      daleelType: type,
      lastRevisedAt: lastRevisedAt,
      sayer: sayer,
      priority: priority,
      tags: tags,
      description: description,
    );
    return put(otherDaleel);
  }

  /// Save other types of Daleel to the local database
  Future<int> saveOthers({
    required Priority priority,
    required DateTime lastRevisedAt,
    required List<String> tags,
    required String text,
    String? sayer,
    String? description,
    DaleelType type = DaleelType.other,
  }) {
    final otherDaleel = Other(
      id: '',
      text: text,
      daleelType: type,
      lastRevisedAt: lastRevisedAt,
      sayer: sayer,
      priority: priority,
      tags: tags,
      description: description,
    );
    return put(otherDaleel);
  }

  /// Deletes a Daleel by its domain model
  Future<bool> deleteDaleel(Daleel daleel) => delete(daleel);

  /// Deletes a Daleel by its ID
  @override
  Future<bool> deleteByID(String id) => deleteByID(id);

  /// Updates a Daleel in the local database
  Future<int> updateDaleel(Daleel updatedDaleel) => put(updatedDaleel);
}
