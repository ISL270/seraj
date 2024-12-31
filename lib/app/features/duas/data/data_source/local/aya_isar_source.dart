import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/features/duas/data/data_source/local/dua_isar.dart';
import 'package:athar/app/features/duas/data/model/dua.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaIsarSource extends IsarSource<Dua, DuaIsar> {
  DuaIsarSource(super.isarService);

  @override
  DuaIsar fromDomain(Dua dm) => DuaIsar.fromDomain(dm);

  Future<int> putDua(DuaIsar dua) => isarService.put<DuaIsar>(dua);
}
