import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:isar/isar.dart';

part 'dua_isar.g.dart';

@collection
final class DuaIsar extends CacheModel<Dua> {
  @override
  String id;
  @Index(type: IndexType.value, caseSensitive: false)
  String text;
  bool isFavourite;
  String? reward;
  String? description;
  List<String> tags;

  DuaIsar({
    required this.id,
    required this.text,
    required this.tags,
    required this.isFavourite,
    this.reward,
    this.description,
  });

  factory DuaIsar.fromDomain(Dua domain) => DuaIsar(
        id: domain.id,
        text: domain.text,
        tags: domain.tags,
        reward: domain.reward,
        description: domain.description,
        isFavourite: domain.isFavourite,
      );

  @override
  Dua toDomain() {
    return Dua(
      isFavourite: isFavourite,
      id: id,
      text: text,
      tags: tags,
      reward: reward,
      description: description,
    );
  }
}
