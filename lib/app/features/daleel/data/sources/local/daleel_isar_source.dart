import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/daleel/data/models/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelIsarSource extends IsarSource<Daleel, DaleelIsar> {
  const DaleelIsarSource(super.isarService);

  Future<DaleelIsar?> getSavedDaleel() => isarService.getFirst<DaleelIsar>();

  Future<void> saveDaleel(Daleel daleel) => isarService.put(DaleelIsar.fromDomain(daleel));

  Future<void> deleteSavedDaleel() => isarService.clear<DaleelIsar>();

  @override
  DaleelIsar fromDomain(Daleel dm) => DaleelIsar.fromDomain(dm);
}
