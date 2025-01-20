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
  final String id;
  // used for full-text search feature
  @Index(type: IndexType.value, caseSensitive: false)
  final String text;
  final String? description;
  final String? sayer;
  @Enumerated(EnumType.name)
  final Priority priority;
  @Enumerated(EnumType.name)
  final DaleelType daleelType;
  final List<String> tags;
  final DateTime lastRevisedAt;

  // Hadith related
  final String? hadithExtraction;
  @Enumerated(EnumType.name)
  final HadithAuthenticity? hadithAuthenticity;

  final String? surah;
  final int? firstAya;
  final int? lastAya;

  const DaleelIsar({
    required this.id,
    required this.text,
    required this.tags,
    required this.priority,
    required this.daleelType,
    required this.lastRevisedAt,
    this.sayer,
    this.surah,
    this.lastAya,
    this.firstAya,
    this.description,
    this.hadithExtraction,
    this.hadithAuthenticity,
  });

  factory DaleelIsar.fromDomain(Daleel daleel) => switch (daleel) {
        Hadith() => DaleelIsar(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            sayer: daleel.sayer,
            priority: daleel.priority,
            daleelType: DaleelType.hadith,
            description: daleel.description,
            lastRevisedAt: daleel.lastRevisedAt,
            hadithExtraction: daleel.extraction,
            hadithAuthenticity: daleel.authenticity,
          ),
        Aya() => DaleelIsar(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            surah: daleel.surah,
            sayer: daleel.sayer,
            lastAya: daleel.lastAya,
            priority: daleel.priority,
            firstAya: daleel.firstAya,
            daleelType: DaleelType.aya,
            description: daleel.description,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
        Athar() => DaleelIsar(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            sayer: daleel.sayer,
            priority: daleel.priority,
            daleelType: DaleelType.athar,
            description: daleel.description,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
        Other() => DaleelIsar(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            sayer: daleel.sayer,
            priority: daleel.priority,
            daleelType: DaleelType.other,
            description: daleel.description,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
      };

  @override
  Daleel toDomain() => switch (daleelType) {
        DaleelType.aya => Aya(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            surah: surah!,
            lastAya: lastAya,
            priority: priority,
            firstAya: firstAya!,
            description: description,
            lastRevisedAt: lastRevisedAt,
          ),
        DaleelType.hadith => Hadith(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            extraction: hadithExtraction,
            lastRevisedAt: lastRevisedAt,
            authenticity: hadithAuthenticity,
          ),
        DaleelType.athar => Athar(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
          ),
        DaleelType.other => Other(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
          )
      };
}
