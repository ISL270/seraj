import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
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
  DateTime lastRevisedAt;

  // Hadith related
  String? hadithExtraction;
  @Enumerated(EnumType.name)
  HadithAuthenticity? hadithAuthenticity;

  DaleelIsar({
    required this.id,
    required this.text,
    required this.priority,
    required this.daleelType,
    required this.tags,
    required this.lastRevisedAt,
    this.sayer,
    this.description,
    this.hadithExtraction,
    this.hadithAuthenticity,
  });

  @override
  Daleel toDomain() => switch (daleelType) {
        DaleelType.hadith => Hadith(
            id: id,
            text: text,
            priority: priority,
            description: description,
            authenticity: hadithAuthenticity,
            extraction: hadithExtraction,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
            sayer: sayer,
          ),
        DaleelType.athar => Athar(
            id: id,
            text: text,
            priority: priority,
            description: description,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
            sayer: sayer,
          ),
      };

  factory DaleelIsar.fromDomain(Daleel daleel) => switch (daleel) {
        Hadith() => DaleelIsar(
            id: daleel.id,
            text: daleel.text,
            priority: daleel.priority,
            description: daleel.description,
            daleelType: DaleelType.hadith,
            hadithAuthenticity: daleel.authenticity,
            hadithExtraction: daleel.extraction,
            sayer: daleel.sayer,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
        Athar() => DaleelIsar(
            id: daleel.id,
            text: daleel.text,
            priority: daleel.priority,
            description: daleel.description,
            daleelType: DaleelType.athar,
            sayer: daleel.sayer,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
      };
}
