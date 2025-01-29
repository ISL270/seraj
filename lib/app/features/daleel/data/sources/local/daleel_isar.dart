import 'package:athar/app/core/isar/cache_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:isar/isar.dart';

part 'daleel_isar.g.dart';

@collection
final class DaleelIsar extends CacheModel<Daleel> {
  @Index(type: IndexType.value, caseSensitive: false)
  String text;
  String? description;
  String? sayer;
  @Enumerated(EnumType.name)
  Priority priority;
  @Enumerated(EnumType.name)
  DaleelType daleelType;
  List<String> tags;
  DateTime lastRevisedAt;

  // Hadith-specific fields
  String? hadithExtraction;
  @Enumerated(EnumType.name)
  HadithAuthenticity? hadithAuthenticity;

  @Index(type: IndexType.value, caseSensitive: false)
  String? surah;
  int? firstAya;
  int? lastAya;

  DaleelIsar({
    required this.text,
    required this.tags,
    required this.priority,
    required this.daleelType,
    required this.lastRevisedAt,
    super.id,
    this.sayer,
    this.surah,
    this.firstAya,
    this.lastAya,
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
            firstAya: daleel.firstAya,
            lastAya: daleel.lastAya,
            priority: daleel.priority,
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
            daleelType: DaleelType.hadith,
          ),
        DaleelType.aya => Aya(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            surah: surah ?? '',
            firstAya: firstAya ?? 0,
            lastAya: lastAya,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.aya,
          ),
        DaleelType.athar => Athar(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.athar,
          ),
        DaleelType.other => Other(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.other,
          ),
      };
}
