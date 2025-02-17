import 'package:athar/app/core/models/tag.dart';
import 'package:athar/app/core/models/tag_cm.dart';
import 'package:isar/isar.dart';

part 'azkar_tag_isar.g.dart';

@collection
final class AzkarTagIsar extends TagCM {
  AzkarTagIsar({required super.name, super.id});

  factory AzkarTagIsar.fromDomain(Tag dm) => AzkarTagIsar(name: dm.name, id: dm.id);
}
