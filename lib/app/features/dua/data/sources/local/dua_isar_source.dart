import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/dua/data/sources/local/dua_isar.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/core/models/favourite_filters.dart';
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
    FavouriteFilters? filters,
  }) async {
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.instance.duaIsars.where().textStartsWith(searchTerm).filter(),
      false => isarService.instance.duaIsars.where().anyText().filter(),
    };
    return query
        .optional(
          filters?.favourites.isNotEmpty ?? false,
          (q) => q.anyOf(filters!.favourites, (q, f) => q.isFavouriteEqualTo(f)),
        )
        .offset(page * pageSize)
        .limit(pageSize)
        .findAll();
  }
}
