// ignore_for_file: unused_field

import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/features/dua/data/dua_isar.dart';
import 'package:athar/app/features/dua/data/dua_isar_source.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaRepository extends Repository<Dua, DuaIsar> {
  final DuaIsarSource _localSource;
  DuaRepository(this._localSource) : super(_localSource);

  void addDua({
    required String text,
    required String reward,
    required List<String> tags,
    required String description,
  }) =>
      _localSource.put(DuaIsar(
        text: text,
        tags: tags,
        reward: reward,
        isFavourite: false,
        description: description,
      ));

  List<Dua> searchDua(
    String searchTerm, {
    required int page,
    required int pageSize,
  }) {
    final cms = _localSource.getDuas(searchTerm, page: page, pageSize: pageSize);
    return cms.map((e) => e.toDomain()).toList();
  }

  void toggleFavourite(Dua dua) {
    final cm = _localSource.get(dua.id!)!;
    cm.isFavourite = !cm.isFavourite;
    _localSource.put(cm);
  }

  @override
  DuaIsar fromDomain(Dua dm) => DuaIsar.fromDomain(dm);
}
