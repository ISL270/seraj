import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:isar/isar.dart';

part 'daleel_isar.g.dart';

@collection
final class DaleelIsar extends CacheModel<Daleel> {
  @override
  String id;

  String text;

  String? description;

  String? sayer;

  @Enumerated(EnumType.name)
  Priority priority;

  @Enumerated(EnumType.name)
  DaleelType daleelType;

  List<String> tags;

  DateTime? lastRevisedAt;

  // Hadith related
  String? rawi;

  String? extraction;

  @Enumerated(EnumType.name)
  HadithAuthenticity? hadithAuthenticity;

  DaleelIsar({
    required this.id,
    required this.text,
    required this.priority,
    required this.daleelType,
    this.hadithAuthenticity,
    this.description,
    this.sayer,
    this.tags = const [],
    this.lastRevisedAt,
    this.extraction,
    this.rawi,
  });

  @override
  Daleel toDomain() => switch (daleelType) {
        DaleelType.hadith => Hadith(
            id: id,
            text: text,
            priotiy: priority,
            description: description,
            authenticity: hadithAuthenticity,
            extraction: extraction,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
            rawi: rawi,
          ),
      };

  factory DaleelIsar.fromDomain(Daleel daleel) => switch (daleel) {
        Hadith() => DaleelIsar(
            id: daleel.id,
            text: daleel.text,
            priority: daleel.priotiy,
            daleelType: DaleelType.hadith,
            hadithAuthenticity: daleel.authenticity,
            extraction: daleel.extraction,
            rawi: daleel.rawi,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
            description: daleel.description,
          )
      };
}
