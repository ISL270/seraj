import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/models/tag_cm.dart';
import 'package:isar/isar.dart';

part 'daleel_tag_isar.g.dart';

@collection
final class DaleelTagIsar extends TagCM {
  DaleelTagIsar({required super.name, super.id});

  factory DaleelTagIsar.fromDomain(Tag dm) => DaleelTagIsar(id: dm.id, name: dm.name);
}
