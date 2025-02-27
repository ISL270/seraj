// ignore_for_file: inference_failure_on_function_invocation, cascade_invocations

import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
import 'package:athar/app/features/daleel/sub_features/tags/data/daleel_tag_isar.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class DaleelIsarSource extends IsarSource<Daleel, DaleelIsar> {
  DaleelIsarSource(super.isarService);

  /// Fetches a paginated list of DaleelIsar objects with optional filtering.
  List<DaleelIsar> getDaleels(
    String searchTerm, {
    required int page,
    required int pageSize,
    DaleelFilters? filters,
  }) {
    final query = searchTerm.isNotBlank
        ? isarService.db.daleelIsars.where().textWithoutDiacriticsStartsWith(searchTerm).filter()
        : isarService.db.daleelIsars.where().anyText().filter();

    return _applyFilters(query, filters).offset(page * pageSize).limit(pageSize).findAllSync();
  }

  // Sorts first by the revision count then last revisited date
  List<DaleelIsar> getSortedDaleels({
    required Set<DaleelType> daleelTypes,
  }) {
    final query = isarService.db.daleelIsars.where().filter();

    return query
        .optional(
          daleelTypes.isNotEmpty,
          (q) => q.anyOf(daleelTypes, (q, type) => q.daleelTypeEqualTo(type)),
        )
        .sortByRevisionCount()
        .thenByLastRevisedAt()
        .findAllSync();
  }

  /// Filters the query based on the provided filters.
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> _applyFilters(
    QueryBuilder<DaleelIsar, DaleelIsar, QFilterCondition> query,
    DaleelFilters? filters,
  ) {
    if (filters == null) {
      return query as QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>;
    }

    return query
        .optional(
          filters.daleelType.isNotEmpty,
          (q) => q.anyOf(filters.daleelType, (q, type) => q.daleelTypeEqualTo(type)),
        )
        .optional(
          filters.priority.isNotEmpty,
          (q) => q.anyOf(filters.priority, (q, priority) => q.priorityEqualTo(priority)),
        )
        .optional(
          filters.tag.isNotEmpty,
          (q) => q.anyOf(filters.tag, (q, tag) => q.tags((t) => t.nameEqualTo(tag.name))),
          // date removed for now
          // .optional(
          //   filters.date.isNotEmpty,
          //   (q) => q.anyOf(filters.date, (q, date) => q.lastRevisedAtEqualTo(date)),
          // )
        );
  }

  /// Fetches a list of DaleelIsar objects with a specific text match.
  List<DaleelIsar> getByText(String text) {
    return isarService.db.daleelIsars.where().textEqualTo(text).findAllSync();
  }

  /// Retrieves an Aya based on the Surah name and Ayah number.
  Future<Aya?> getAyaByText({required String surahName, required int ayahNumber}) async {
    try {
      final matchingDaleels = await getAll<DaleelIsar>().then(
        (list) => list.where((daleel) =>
            daleel.daleelType == DaleelType.aya &&
            daleel.surah == surahName &&
            daleel.firstAya == ayahNumber),
      );

      return matchingDaleels.isNotEmpty ? matchingDaleels.first.toDomain() as Aya? : null;
    } catch (e) {
      debugPrint('Error fetching Aya: $e');
      return null;
    }
  }

  /// Adds a Daleel along with its tags.
  void addDaleelWithTags({required DaleelIsar daleelIsar, required Set<Tag> tags}) {
    final isar = isarService.db;
    final daleelTags = tags.map(DaleelTagIsar.fromDomain).toList();

    isar.writeTxnSync(() {
      _storeTags(daleelTags);
      daleelIsar.tags.addAll(daleelTags);
      isar.daleelIsars.putSync(daleelIsar);
    });
  }

  /// Updates a Daleel along with its associated tags.
  void updateDaleelWithTags({required DaleelIsar daleelIsar, required Set<Tag> tags}) {
    final isar = isarService.db;

    isar.writeTxnSync(() {
      final existingDaleel = isar.daleelIsars.getSync(daleelIsar.id!);
      if (existingDaleel == null) return;

      _updateDaleelFields(existingDaleel, daleelIsar);
      _updateTags(existingDaleel, tags);

      isar.daleelIsars.putSync(existingDaleel);
    });
  }

  /// Deletes a Daleel entry.
  void deleteDoc(int id) {
    isarService.db.writeTxn(() => isarService.db.daleelIsars.delete(id));
  }

  // --------------------------------
  // Private Helper Methods
  // --------------------------------

  /// Stores tags in the database to ensure they exist before linking.
  void _storeTags(List<DaleelTagIsar> daleelTags) {
    if (daleelTags.isNotEmpty) {
      isarService.db.daleelTagIsars.putAllSync(daleelTags);
    }
  }

  /// Updates the fields of an existing Daleel with new data.
  void _updateDaleelFields(DaleelIsar existing, DaleelIsar updated) {
    existing
      ..lastRevisedAt = updated.lastRevisedAt
      ..text = updated.text
      ..description = updated.description
      ..sayer = updated.sayer
      ..priority = updated.priority;

    if (existing.daleelType == DaleelType.hadith) {
      existing
        ..hadithExtraction = updated.hadithExtraction
        ..hadithAuthenticity = updated.hadithAuthenticity;
    } else if (existing.daleelType == DaleelType.aya) {
      existing
        ..surah = updated.surah
        ..firstAya = updated.firstAya
        ..lastAya = updated.lastAya;
    }
  }

  /// Updates the tags associated with a Daleel, ensuring efficient removal and addition.
  void _updateTags(DaleelIsar daleelIsar, Set<Tag> tags) {
    final newDaleelTags = tags.map(DaleelTagIsar.fromDomain).toList();
    final oldTags = daleelIsar.tags.toList();

    final tagsToRemove =
        oldTags.where((oldTag) => !newDaleelTags.any((newTag) => newTag.id == oldTag.id)).toList();
    final tagsToAdd =
        newDaleelTags.where((newTag) => !oldTags.any((oldTag) => oldTag.id == newTag.id)).toList();

    daleelIsar.tags.removeWhere((tag) => tagsToRemove.any((t) => t.id == tag.id));
    daleelIsar.tags.addAll(tagsToAdd);

    _storeTags(tagsToAdd);
  }

  /// Increments the revision count for a Daleel.
  void incrementRevisionCount(int id) {
    isarService.db.writeTxnSync(() {
      final daleel = isarService.db.daleelIsars.getSync(id);
      if (daleel == null) return;
      daleel.revisionCount++;
      isarService.db.daleelIsars.putSync(daleel);
    });
  }
}
