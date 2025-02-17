// ignore_for_file: unused_field

import 'package:athar/app/core/models/favourite_filters.dart';
import 'package:athar/app/core/models/repository.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/dua/data/dua_isar.dart';
import 'package:athar/app/features/dua/data/dua_isar_source.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar_source.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaRepository extends Repository<Dua, DuaIsar> {
  final DuaIsarSource _localSource;
  final DuaTagIsarSource _tagIsarSource;

  DuaRepository(this._localSource, this._tagIsarSource) : super(_localSource);

  void addDuaOrUpdate({
    required String text,
    required int? id,
    required String reward,
    required Set<Tag> tags,
    required String description,
  }) {
    id == null
        ? _localSource.addDuaWithTags(
            text: text,
            reward: reward,
            description: description,
            tags: tags,
          )
        : _localSource.updateDua(
            text: text,
            reward: reward,
            description: description,
            tags: tags,
            id: id,
          );
  }

  Future<List<Dua>> searchDua(
    String searchTerm, {
    required int page,
    required int pageSize,
    required FavouriteFilters filters,
  }) async {
    final cms = _localSource.getDuas(
      searchTerm,
      page: page,
      pageSize: pageSize,
      filters: filters,
    );
    return cms.map((e) => e.toDomain()).toList();
  }

  void toggleFavourite(Dua dua) {
    final cm = _localSource.get(dua.id!)!;
    cm.isFavourite = !cm.isFavourite;
    _localSource.put(cm);
  }

  List<Tag> getTags() {
    return _tagIsarSource.getAllTags();
  }

  List<Tag> getDuaTagsById({required int id}) {
    return _localSource.get(id)?.toDomain().tags.map((tag) => tag).toList() ?? [];
  }

  @override
  DuaIsar fromDomain(Dua dm) => DuaIsar.fromDomain(dm);
}
