import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:athar/app/features/dua/sub_features/dua_tag/data/dua_tag_isar.dart';
import 'package:isar/isar.dart';

part 'dua_isar.g.dart';

@collection
final class DuaIsar extends CacheModel<Dua> {
  @Index(type: IndexType.value, caseSensitive: false)
  String text;
  String? reward;
  bool isFavourite;
  String? description;
  final tags = IsarLinks<DuaTagIsar>();

  DuaIsar({
    required this.text,
    required this.isFavourite,
    super.id,
    this.reward,
    this.description,
  });

  factory DuaIsar.fromDomain(Dua domain) => DuaIsar(
        id: domain.id,
        text: domain.text,
        reward: domain.reward,
        description: domain.description,
        isFavourite: domain.isFavourite,
      );

  @override
  Dua toDomain() {
    tags.loadSync();
    return Dua(
      id: id,
      text: text,
      tags: tags.map((e) => e.toDomain()).toList(),
      reward: reward,
      isFavourite: isFavourite,
      description: description,
    );
  }
}
