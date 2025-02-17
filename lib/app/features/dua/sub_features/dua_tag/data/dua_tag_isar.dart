import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/models/tag_cm.dart';
import 'package:isar/isar.dart';

part 'dua_tag_isar.g.dart';

@collection
final class DuaTagIsar extends TagCM {
  DuaTagIsar({required super.name, super.id});

  factory DuaTagIsar.fromDomain(Tag dm) => DuaTagIsar(id: dm.id, name: dm.name);
}
