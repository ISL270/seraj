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
  String typeOfDua;

  String numOfRepeat;

  String timeOfDua;

  String? duaNotes;

  DuaIsar({
    required this.id,
    required this.textOfDua,
    required this.typeOfDua,
    required this.timeOfDua,
    required this.numOfRepeat,
    this.duaNotes,
  });

  factory DuaIsar.fromDomain(Dua domain) => DuaIsar(
        id: domain.id ?? '',
        numOfRepeat: domain.numOfRepeat,
        textOfDua: domain.textOfDua,
        typeOfDua: domain.typeOfDua,
        timeOfDua: domain.timeOfDua,
        duaNotes: domain.duaNotes,
      );

  @override
  Dua toDomain() {
    return Dua(
      textOfDua: textOfDua,
      typeOfDua: typeOfDua,
      numOfRepeat: numOfRepeat,
      timeOfDua: typeOfDua,
      duaNotes: duaNotes,
    );
  }
}
