import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:isar/isar.dart';

part 'dua_isar.g.dart';

@collection
final class DuaIsar extends CacheModel<Dua> {
  @Index(type: IndexType.value, caseSensitive: false)
  String text;
  String? reward;
  bool isFavourite;
  List<String> tags;
  String? description;

  DuaIsar({
    required this.text,
    required this.tags,
    required this.isFavourite,
    super.id,
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
      id: id,
      text: text,
      tags: tags,
      reward: reward,
      isFavourite: isFavourite,
      description: description,
    );
  }
}
