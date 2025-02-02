import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/features/daleel/sub_features/tags/data/daleel_tag_isar_source.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar_source.dart';
import 'package:injectable/injectable.dart';

@singleton
final class TagsRepository {
  final DuaTagIsarSource _duaTagIsarSource;
  final DaleelTagIsarSource _daleelTagIsarSource;

  TagsRepository(this._duaTagIsarSource, this._daleelTagIsarSource);

  List<Tag> getAllTags() {
    final duaTags = _duaTagIsarSource.getAllTags();
    final daleelTags = _daleelTagIsarSource.getAllTags();

    return [...duaTags, ...daleelTags];
  }
}
