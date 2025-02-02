import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/sub_features/tags/data/daleel_tag_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class DaleelTagIsarSource extends IsarSource<Tag, DaleelTagIsar> {
  DaleelTagIsarSource(super.isarService);
  List<Tag> getAllTags() {
    final daleelTags = isarService.db.daleelTagIsars.where().findAllSync().map((e) => e.toDomain());
    final allTags = [...daleelTags]; // Combine both lists
    return allTags;
  }
}
