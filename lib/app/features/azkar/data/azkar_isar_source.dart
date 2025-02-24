// ignore_for_file: inference_failure_on_function_invocation

import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/azkar/data/azkar_isar.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:athar/app/features/azkar/presentation/models/azkar_filters.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_tag/data/azkar_tag_isar.dart';
import 'package:dartx/dartx_io.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class AzkarIsarSource extends IsarSource<Azkar, AzkarIsar> {
  AzkarIsarSource(super.isarService);

  void addAzkar({
    required String text,
    required String description,
    required int noOfRepetitions,
    required Set<Tag> tags,
  }) {
    final azkarIsar = AzkarIsar(
      text: text,
      description: description,
      noOfRepetitions: noOfRepetitions,
      isFavourite: false,
    );
    final azkarTagIsars = tags.map(AzkarTagIsar.fromDomain).toList();
    isarService.db.writeTxnSync(() {
      isarService.db.azkarTagIsars.putAllSync(azkarTagIsars);
      azkarIsar.tags.addAll(azkarTagIsars);
      isarService.db.azkarIsars.putSync(azkarIsar);
    });
  }

  List<AzkarIsar> getAzkar(
    String searchTerm, {
    required int page,
    required int pageSize,
    AzkarFilters? filters,
  }) {
    if (filters == null) {
      return isarService.db.azkarIsars
          .where()
          .anyText()
          .offset(page * pageSize)
          .limit(pageSize)
          .findAllSync();
    }
    final query = switch (searchTerm.isNotBlank) {
      true => isarService.db.azkarIsars.where().textStartsWith(searchTerm).filter(),
      false => isarService.db.azkarIsars.where().anyText().filter(),
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

  void updateAzkar({
    required int id,
    String? text,
    String? description,
    int? noOfRepetitions,
    Set<Tag>? tags,
  }) {
    isarService.db.writeTxnSync(() {
      final azkarIsar = isarService.db.azkarIsars.getSync(id);
      if (azkarIsar == null) return;
      if (text != null) azkarIsar.text = text;
      if (description != null) azkarIsar.description = description;
      if (noOfRepetitions != null) azkarIsar.noOfRepetitions = noOfRepetitions;
      if (tags != null) {
        final azkarTagIsars = tags.map(AzkarTagIsar.fromDomain).toList();
        isarService.db.azkarTagIsars.putAllSync(azkarTagIsars);
        azkarIsar.tags
          ..clear()
          ..addAll(azkarTagIsars);
      }

      isarService.db.azkarIsars.putSync(azkarIsar);
    });
  }

  void deleteDoc(int id) => isarService.db.writeTxn(() => isarService.db.azkarIsars.delete(id));
}
