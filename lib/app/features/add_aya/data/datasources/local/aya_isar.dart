import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/add_aya/data/models/aya_model.dart';
import 'package:isar/isar.dart';

part 'aya_isar.g.dart';

@collection
final class AyaIsar extends CacheModel<AyaModel> {
  @override
  String id;

  @Index(type: IndexType.value, caseSensitive: false)
  String textOfAya;

  @enumerated
  String? ayaExplain;

  String surahOfAya;
  String nomOfAya;

  AyaIsar({
    required this.id,
    required this.textOfAya,
    required this.surahOfAya,
    required this.nomOfAya,
    this.ayaExplain,
  });

  factory AyaIsar.fromDomain(AyaModel domain) => AyaIsar(
        id: domain.id ?? '',
        textOfAya: domain.textOfAya,
        ayaExplain: domain.ayaExplain,
        surahOfAya: domain.surahOfAya,
        nomOfAya: domain.nomOfAya,
      );

  @override
  AyaModel toDomain() {
    return AyaModel(
      id: id,
      textOfAya: textOfAya,
      ayaExplain: ayaExplain,
      surahOfAya: surahOfAya,
      nomOfAya: nomOfAya,
    );
  }
}
