import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DuaTagIsarSource extends IsarSource<Tag, DuaTagIsar> {
  DuaTagIsarSource(super.isarService);
}
