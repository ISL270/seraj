import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelIsarSource extends IsarSource<Daleel, DaleelIsar> {
  const DaleelIsarSource(super.isarService);

  Future<DaleelIsar?> getSavedDaleel() => isarService.getFirst<DaleelIsar>();

  Future<DaleelIsar?> getDaleel(String id) => isarService.get<DaleelIsar>(id);

  Future<void> saveDaleel(Daleel daleel) => isarService.put(DaleelIsar.fromDomain(daleel));

  Future<void> deleteSavedDaleel() => isarService.clear<DaleelIsar>();

  @override
  DaleelIsar fromDomain(Daleel dm) => DaleelIsar.fromDomain(dm);

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
