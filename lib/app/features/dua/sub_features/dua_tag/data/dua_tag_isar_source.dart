import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class DuaTagIsarSource extends IsarSource<Tag, DuaTagIsar> {
  DuaTagIsarSource(super.isarService);

  List<Tag> getAllTags() {
    final duaTags = isarService.db.duaTagIsars.where().findAllSync().map((e) => e.toDomain());

    final allTags = [...duaTags]; // Combine both lists
    return allTags;
  }

  void updateDuaTag({required int id, required String newTag}) {
    final isar = isarService.db;
    isar.writeTxnSync(() {
      final tagToUpdate = isar.duaTagIsars.getSync(id);
      if (tagToUpdate != null) {
        tagToUpdate.name = newTag;
        isar.duaTagIsars.putSync(tagToUpdate);
      }
    });
  }
}
