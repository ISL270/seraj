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

  List<DaleelIsar> getDaleels(
    String searchTerm, {
    required int page,
    required int pageSize,
    DaleelFilters? filters,
  }) {
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.db.daleelIsars.where().textStartsWith(searchTerm).filter(),
      false => isarService.db.daleelIsars.where().anyText().filter(),
    };
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
        .findAllSync();
  }

  // New getByText function
  List<DaleelIsar> getByText(String text) {
    final query = isarService.db.daleelIsars.where().textEqualTo(text);
    return query.findAllSync();
  }

  // Updated getAyaByText function
  Future<Aya?> getAyaByText({required String surahName, required int ayahNumber}) async {
    try {
      final daleelIsars = await getAll<DaleelIsar>();
      final matchingDaleels = daleelIsars.where(
        (DaleelIsar daleel) =>
            daleel.daleelType == DaleelType.aya &&
            daleel.surah == surahName &&
            daleel.firstAya == ayahNumber,
      );
      if (matchingDaleels.isNotEmpty) {
        final daleelIsar = matchingDaleels.first;
        debugPrint('########### ${daleelIsar.toDomain() as Aya?} ###########');
        return daleelIsar.toDomain() as Aya?;
      }
      return null;
    } catch (e) {
      debugPrint('########### Error: $e ###########');
      return null; // Return null in case of an exception.
    }
  }

  void addDaleelWithTags({
    required DaleelIsar daleelIsar,
    required Set<Tag> tags,
  }) {
    final isar = isarService.db;
    final daleelTags = tags.map(DaleelTagIsar.fromDomain).toList();
    isar.writeTxnSync(() {
      isar.daleelTagIsars.putAllSync(daleelTags);
      daleelIsar.tags.addAll(daleelTags);
      isar.daleelIsars.putSync(daleelIsar);
    });
  }

  void updateDaleelWithTags({
    required DaleelIsar daleelIsar,
    required Set<Tag> tags,
  }) {
    final isar = isarService.db;

    isar.writeTxnSync(() {
      //Fetch existing Hadith by ID
      final existingDaleel = isar.daleelIsars.getSync(daleelIsar.id!);

      if (existingDaleel != null) {
        // to update last revised date
        existingDaleel.lastRevisedAt = daleelIsar.lastRevisedAt;

        // Update the main fields of existing daleel
        existingDaleel.text = daleelIsar.text;
        existingDaleel.description = daleelIsar.description;
        existingDaleel.sayer = daleelIsar.sayer;
        existingDaleel.priority = daleelIsar.priority;

        if (existingDaleel.daleelType == DaleelType.hadith) {
          // Update the fields of the existing Hadith
          existingDaleel.hadithExtraction = daleelIsar.hadithExtraction;
          existingDaleel.hadithAuthenticity = daleelIsar.hadithAuthenticity;
        } else if (existingDaleel.daleelType == DaleelType.aya) {
          // Update the fields of the existing aya
          existingDaleel.surah = daleelIsar.surah;
          existingDaleel.firstAya = daleelIsar.firstAya;
          existingDaleel.lastAya = daleelIsar.lastAya;
        }

        // athar and others is the same main fields.

        //Convert and add new tags
        final daleelTags = tags.map(DaleelTagIsar.fromDomain).toList();

        // Ensure only new tags are added
        isar.daleelTagIsars.putAllSync(daleelTags);

        // Clear old tags and update with the correct ones
        existingDaleel.tags.clear();
        existingDaleel.tags.addAll(daleelTags);

        //Save the updated Hadith back to the database
        isar.daleelIsars.putSync(existingDaleel);
      }
    });
  }

  void deleteDoc(int id) => isarService.db.writeTxn(() => isarService.db.daleelIsars.delete(id));
}
