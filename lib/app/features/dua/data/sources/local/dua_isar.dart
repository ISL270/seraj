import 'package:athar/app/core/extension_types/string_id.dart';
import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/dua/domain/dua.dart';
import 'package:isar/isar.dart';

part 'dua_isar.g.dart';

@collection
final class DuaIsar extends CacheModel<Dua> {
  @override
  StringID id;
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
        id: StringID(domain.id),
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
      id: id.value,
      text: text,
      tags: tags,
      reward: reward,
      description: description,
    );
  }
}
