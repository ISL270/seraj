import 'package:athar/app/core/extension_types/string_id.dart';
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
  StringID id;
  // used for full-text search feature
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

  // Hadith related
  String? hadithExtraction;
  @Enumerated(EnumType.name)
  HadithAuthenticity? hadithAuthenticity;

  String? surah;
  int? firstAya;
  int? lastAya;

  DaleelIsar({
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
            id: StringID(daleel.id),
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
        Aya() => DaleelIsar(
            id: StringID(daleel.id),
            text: daleel.text,
            priority: daleel.priority,
            description: daleel.description,
            daleelType: DaleelType.aya,
            surah: daleel.surah,
            firstAya: daleel.firstAya,
            lastAya: daleel.lastAya,
            sayer: daleel.sayer,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
        Athar() => DaleelIsar(
            id: StringID(daleel.id),
            text: daleel.text,
            priority: daleel.priority,
            description: daleel.description,
            daleelType: DaleelType.athar,
            sayer: daleel.sayer,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
        Other() => DaleelIsar(
            id: StringID(daleel.id),
            text: daleel.text,
            priority: daleel.priority,
            description: daleel.description,
            daleelType: DaleelType.other,
            sayer: daleel.sayer,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
      };

  @override
  Daleel toDomain() => switch (daleelType) {
        DaleelType.aya => Aya(
            id: id.value,
            text: text,
            tags: tags,
            sayer: sayer,
            surah: surah ?? '',
            lastAya: lastAya,
            priority: priority,
            firstAya: firstAya ?? 0,
            description: description,
            lastRevisedAt: lastRevisedAt,
          ),
        DaleelType.hadith => Hadith(
            id: id.value,
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
            id: id.value,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
          ),
        DaleelType.other => Other(
            id: id.value,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
          )
      };
}
