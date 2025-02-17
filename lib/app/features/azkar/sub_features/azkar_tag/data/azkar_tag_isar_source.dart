import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/azkar/sub_features/azkar_tag/data/azkar_tag_isar.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@singleton
final class AzkarTagIsarSource extends IsarSource<Tag, AzkarTagIsar> {
  AzkarTagIsarSource(super.isarService);

  List<Tag> getAllTags() {
    final azkarTags = isarService.db.azkarTagIsars.where().findAllSync().map((e) => e.toDomain());
    return azkarTags.toList();
  }

  void updateAzkarTag({required int id, required String newTag}) {
    final isar = isarService.db;
    isar.writeTxnSync(() {
      final tagToUpdate = isar.azkarTagIsars.getSync(id);
      if (tagToUpdate != null) {
        tagToUpdate.name = newTag;
        isar.azkarTagIsars.putSync(tagToUpdate);
      }
    });
  }
}
