import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/daleel/data/sources/local/daleel_isar.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelIsarSource extends IsarSource<Daleel, DaleelIsar> {
  const DaleelIsarSource(super.isarService);

  Future<DaleelIsar?> getSavedDaleel() => isarService.getFirst<DaleelIsar>();

  Future<DaleelIsar?> getDaleel(String id) => isarService.get<DaleelIsar>(id);

  Future<void> saveDaleel(Daleel daleel) => isarService.put(DaleelIsar.fromDomain(daleel));

  Future<void> deleteSavedDaleel() => isarService.clear<DaleelIsar>();

  Future<void> getAllDaleels() => isarService.getAll<DaleelIsar>();

  // Future<List<DaleelIsar>> getDaleels(
  //   String searchTerm, {
  //   required int page,
  //   required int pageSize,
  // }) async {
  //   final query = switch (searchTerm.isNotBlank) {
  //     true => isarService.instance.daleelIsars.where().text,
  //     false => isarService.instance.daleelIsars.where().anyText(),
  //   };
  //   return query.offset(page * pageSize).limit(pageSize).findAll();
  // }

  @override
  DaleelIsar fromDomain(Daleel dm) => DaleelIsar.fromDomain(dm);
}
