import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/core/models/tag.dart';

abstract base class TagCM extends CacheModel<Tag> {
  String name;

  TagCM({required this.name, super.id});

  @override
  Tag toDomain() => Tag(id, name);
}
