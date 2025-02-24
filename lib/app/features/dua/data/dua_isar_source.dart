// ignore_for_file: inference_failure_on_function_invocation

import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/dua/data/dua_isar.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/presentation/models/dua_filters.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar.dart';
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
    DuaFilters? filters,
  }) {
    if (filters == null) {
      return isarService.db.duaIsars
          .where()
          .anyText()
          .offset(page * pageSize)
          .limit(pageSize)
          .findAllSync();
    }
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.db.duaIsars.where().textStartsWith(searchTerm).filter(),
      false => isarService.db.duaIsars.where().anyText().filter(),
    };
    return query
        .optional(
          filters.favourites.isNotEmpty,
          (q) => q.anyOf(filters.favourites, (q, f) => q.isFavouriteEqualTo(f)),
        )
        .optional(
          filters.tags.isNotEmpty,
          (q) => q.anyOf(filters.tags, (q, tag) => q.tags((t) => t.nameEqualTo(tag.name))),
        )
        .offset(page * pageSize)
        .limit(pageSize)
        .findAllSync();
  }

  void addDuaWithTags({
    required String text,
    required String reward,
    required Set<Tag> tags,
    required String description,
  }) {
    final duaIsar = DuaIsar(
      text: text,
      reward: reward,
      isFavourite: false,
      description: description,
    );
    final duaTagIsars = tags.map(DuaTagIsar.fromDomain).toList();
    isarService.db.writeTxnSync(() {
      isarService.db.duaTagIsars.putAllSync(duaTagIsars);
      duaIsar.tags.addAll(duaTagIsars);
      isarService.db.duaIsars.putSync(duaIsar);
    });
  }

  void updateDua({
    required int id,
    String? text,
    String? reward,
    String? description,
    Set<Tag>? tags,
    bool? isFavourite,
  }) {
    isarService.db.writeTxnSync(() {
      final duaIsar = isarService.db.duaIsars.getSync(id);
      if (duaIsar == null) return;

      // Update text fields if provided
      if (text != null) duaIsar.text = text;
      if (reward != null) duaIsar.reward = reward;
      if (description != null) duaIsar.description = description;
      if (isFavourite != null) duaIsar.isFavourite = isFavourite;

      if (tags != null) {
        final duaTagIsars = tags.map(DuaTagIsar.fromDomain).toList();

        // Remove tags that are no longer needed
        final existingTags = duaIsar.tags.toList();
        final tagsToRemove = existingTags
            .where((oldTag) => !duaTagIsars.any((newTag) => newTag.id == oldTag.id))
            .toList();
        final tagsToAdd = duaTagIsars
            .where((newTag) => !existingTags.any((oldTag) => oldTag.id == newTag.id))
            .toList();

        duaIsar.tags.removeWhere((tag) => tagsToRemove.any((t) => t.id == tag.id));
        duaIsar.tags.addAll(tagsToAdd);

        isarService.db.duaTagIsars.putAllSync(tagsToAdd);
      }

      isarService.db.duaIsars.putSync(duaIsar);
    });
  }
}
