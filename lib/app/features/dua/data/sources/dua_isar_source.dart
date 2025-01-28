import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/dua/data/sources/dua_isar.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:dartx/dartx_io.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class DuaIsarSource extends IsarSource<Dua, DuaIsar> {
  DuaIsarSource(super.isarService);

  @override
  DuaIsar fromDomain(Dua dm) => DuaIsar.fromDomain(dm);

  Future<List<DuaIsar>> getDuas(
    String searchTerm, {
    required int page,
    required int pageSize,
  }) async {
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.instance.duaIsars.where().textStartsWith(searchTerm),
      false => isarService.instance.duaIsars.where().anyText(),
    };
    return query.offset(page * pageSize).limit(pageSize).findAll();
  }
}
