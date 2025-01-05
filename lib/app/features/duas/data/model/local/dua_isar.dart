import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:athar/app/features/duas/domain/model/dua.dart';
import 'package:isar/isar.dart';

part 'dua_isar.g.dart';

@collection
final class DuaIsar extends CacheModel<Dua> {
  @override
  String id;

  @Index(type: IndexType.value, caseSensitive: false)
  String text;

  String? reward;

  String? description;

  List<String> tags;

  @Enumerated(EnumType.name)
  Priority priority;

  DuaIsar({
    required this.id,
    required this.text,
    required this.priority,
    required this.tags,
    required this.reward,
    required this.description,
  });

  factory DuaIsar.fromDomain(Dua domain) => DuaIsar(
        id: domain.id,
        text: domain.text,
        priority: domain.priority,
        tags: domain.tags,
        reward: domain.reward,
        description: domain.description,
      );

  @override
  Dua toDomain() {
    return Dua(
      id: id,
      text: text,
      tags: tags,
      reward: reward,
      priority: priority,
      description: description,
    );
  }
}
