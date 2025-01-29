import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/dua/data/dua_isar.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:dartx/dartx_io.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class DuaIsarSource extends IsarSource<Dua, DuaIsar> {
  DuaIsarSource(super.isarService);

  List<DuaIsar> getDuas(
    String searchTerm, {
    required int page,
    required int pageSize,
  }) {
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.db.duaIsars.where().textStartsWith(searchTerm),
      false => isarService.db.duaIsars.where().anyText(),
    };
    return query.offset(page * pageSize).limit(pageSize).findAllSync();
  }
}
