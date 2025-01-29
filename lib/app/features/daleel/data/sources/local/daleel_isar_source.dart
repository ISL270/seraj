import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
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
  }) {
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.db.daleelIsars.where().textStartsWith(searchTerm),
      false => isarService.db.daleelIsars.where().anyText(),
    };
    return query.offset(page * pageSize).limit(pageSize).findAllSync();
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
}
