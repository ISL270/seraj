// ignore_for_file: unused_field

import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/dua/data/dua_isar.dart';
import 'package:athar/app/features/dua/data/dua_isar_source.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaRepository extends Repository<Dua, DuaIsar> {
  final DuaIsarSource _localSource;
  DuaRepository(this._localSource) : super(_localSource);

  void addDua({
    required String text,
    required String reward,
    required List<Tag> tags,
    required String description,
  }) {
    final duaIsar = DuaIsar(
      text: text,
      reward: reward,
      isFavourite: false,
      description: description,
    );

    duaIsar.tags.addAll(tags.map(DuaTagIsar.fromDomain));

    _localSource.put(duaIsar);
  }

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
