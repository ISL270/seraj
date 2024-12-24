import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/data/models/hadith_model.dart';
import 'package:athar/app/features/add_hadith/features/add_hadith/domain/models/hadith_type.dart';
import 'package:isar/isar.dart';

part 'hadith_isar.g.dart';

@collection
final class HadithIsar extends CacheModel<HadithModel> {
  @override
  String id;

  @Index(type: IndexType.value, caseSensitive: false)
  String textOfHadith;

  @enumerated
  HadithType hadithType;

  String? isnadOfHadith;

  String? sourceOfHadith;

  String? hadithExplain;

  HadithIsar({
    required this.id,
    required this.textOfHadith,
    required this.hadithType,
    this.isnadOfHadith,
    this.sourceOfHadith,
    this.hadithExplain,
  });

  factory HadithIsar.fromDomain(HadithModel domain) => HadithIsar(
        id: domain.id,
        textOfHadith: domain.textOfHadith,
        hadithType: domain.hadithType,
        isnadOfHadith: domain.isnadOfHadith,
        sourceOfHadith: domain.sourceOfHadith,
        hadithExplain: domain.hadithExplain,
      );

  @override
  HadithModel toDomain() {
    return HadithModel(
      id: id,
      textOfHadith: textOfHadith,
      hadithType: hadithType,
      isnadOfHadith: isnadOfHadith,
      sourceOfHadith: sourceOfHadith,
      hadithExplain: hadithExplain,
    );
  }
}
