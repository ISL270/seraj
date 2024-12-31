import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/duas/data/model/dua.dart';
import 'package:isar/isar.dart';

part 'dua_isar.g.dart';

@collection
final class DuaIsar extends CacheModel<Dua> {
  @override
  String id;

  @Index(type: IndexType.value, caseSensitive: false)
  String textOfDua;

  @enumerated
  String? reward;

  String? numOfRepeat;

  String? explanation;

  String? priority;

  DuaIsar({
    required this.id,
    required this.textOfDua,
    this.reward,
    this.numOfRepeat,
    this.explanation,
    this.priority,
  });

  factory DuaIsar.fromDomain(Dua domain) => DuaIsar(
        id: domain.id ?? '',
        numOfRepeat: domain.numOfRepeat,
        textOfDua: domain.textOfDua,
        reward: domain.reward,
        explanation: domain.explanation,
        priority: domain.priority,
      );

  @override
  Dua toDomain() {
    return Dua(
      textOfDua: textOfDua,
      numOfRepeat: numOfRepeat,
      reward: reward,
      explanation: explanation,
      priority: priority,
    );
  }
}
