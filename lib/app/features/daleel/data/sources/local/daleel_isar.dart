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

  // Full-text search index
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

  // Hadith-specific fields
  final String? hadithExtraction;
  @Enumerated(EnumType.name)
  final HadithAuthenticity? hadithAuthenticity;

  // Aya-specific fields
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
    this.firstAya,
    this.lastAya,
    this.description,
    this.hadithExtraction,
    this.hadithAuthenticity,
  });

  factory DaleelIsar.fromDomain(Daleel daleel) {
    switch (daleel) {
      case Hadith():
        return DaleelIsar(
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
        );
      case Aya():
        return DaleelIsar(
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
        );
      case Athar():
        return DaleelIsar(
          id: daleel.id,
          text: daleel.text,
          tags: daleel.tags,
          sayer: daleel.sayer,
          priority: daleel.priority,
          daleelType: DaleelType.athar,
          description: daleel.description,
          lastRevisedAt: daleel.lastRevisedAt,
        );
      case Other():
        return DaleelIsar(
          id: daleel.id,
          text: daleel.text,
          tags: daleel.tags,
          sayer: daleel.sayer,
          priority: daleel.priority,
          daleelType: DaleelType.other,
          description: daleel.description,
          lastRevisedAt: daleel.lastRevisedAt,
        );
      default:
        throw Exception('Unsupported DaleelType');
    }
  }

  /// Map from database model (`DaleelIsar`) to domain model (`Daleel`)
  @override
  Daleel toDomain() {
    switch (daleelType) {
      case DaleelType.hadith:
        return Hadith(
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
        );
      case DaleelType.aya:
        return Aya(
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
        );
      case DaleelType.athar:
        return Athar(
          id: id,
          text: text,
          tags: tags,
          sayer: sayer,
          priority: priority,
          description: description,
          lastRevisedAt: lastRevisedAt,
          daleelType: DaleelType.athar,
        );
      case DaleelType.other:
        return Other(
          id: id,
          text: text,
          tags: tags,
          sayer: sayer,
          priority: priority,
          description: description,
          lastRevisedAt: lastRevisedAt,
          daleelType: DaleelType.other,
        );
      default:
        throw Exception('Unsupported DaleelType');
    }
  }
}
