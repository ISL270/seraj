import 'package:athar/app/core/isar/isar_source.dart';
import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/sub_features/tags/data/daleel_tag_isar.dart';
import 'package:injectable/injectable.dart';

@singleton
final class DaleelTagIsarSource extends IsarSource<Tag, DaleelTagIsar> {
  DaleelTagIsarSource(super.isarService);
}
