// ignore_for_file: inference_failure_on_function_invocation

import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/presentation/models/daleel_filters.dart';
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

  void deleteDoc(int id) => isarService.db.writeTxn(() => isarService.db.daleelIsars.delete(id));
}
