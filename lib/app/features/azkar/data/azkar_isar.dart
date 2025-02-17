import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/azkar/domain/azkar.dart';
import 'package:isar/isar.dart';

part 'azkar_isar.g.dart';

@collection
final class AzkarIsar extends CacheModel<Azkar> {
  // used for full-text searching
  @Index(type: IndexType.value, caseSensitive: false)
  String text;

  // final List<String> tags;

  String? description;

  int noOfRepetitions;

  bool isFavourite;

  // final tags = IsarLinks<AzkarTagIsar>();

  AzkarIsar({
    required this.text,
    // required this.tags,
    required this.description,
    required this.noOfRepetitions,
    required this.isFavourite,
    super.id,
  });

  factory AzkarIsar.fromDomain(Azkar domain) => AzkarIsar(
        id: domain.id,
        text: domain.text,
        description: domain.description,
        noOfRepetitions: domain.noOfRepetitions,
        isFavourite: domain.isFavourite,
      );

  @override
  Azkar toDomain() => Azkar(
        id: id,
        text: text,
        // tags: tags,
        description: description,
        noOfRepetitions: noOfRepetitions,
        isFavourite: isFavourite,
      );
}
