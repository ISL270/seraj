import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';

sealed class Daleel {
  final String id;
  final String text;
  final String? description;
  final Priority priority;
  final String? sayer;
  final List<String> tags;
  final DateTime? lastRevisedAt;

  const Daleel({
    required this.id,
    required this.text,
    required this.sayer,
    this.priority = Priority.normal,
    this.lastRevisedAt,
    this.tags = const [],
    this.description,
  });
}

final class Hadith extends Daleel {
  final String? extraction;
  final HadithAuthenticity? hadithAuthenticity;

  const Hadith({
    required super.id,
    required super.text,
    required super.priority,
    required super.tags,
    required super.lastRevisedAt,
    required super.description,
    required super.sayer,
    this.extraction,
    this.hadithAuthenticity,
  });

  Map<String, dynamic> toJson(Hadith hadith) => <String, dynamic>{
        'id': hadith.id,
        'text': hadith.text,
        'priotiy': priorityEnumMap[hadith.priority],
        'description': hadith.description,
        'hadithAuthenticity': hadithAuthenticityEnumMap[hadith.hadithAuthenticity],
        'extraction': hadith.extraction,
        'tags': hadith.tags,
        'lastRevisedAt': hadith.lastRevisedAt?.toIso8601String(),
        'sayer': hadith.sayer,
      };
}

Map<Priority, String> priorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.normal: 'normal',
};
Map<HadithAuthenticity, String> hadithAuthenticityEnumMap = {
  HadithAuthenticity.daif: 'daif',
  HadithAuthenticity.hasan: 'hasan',
  HadithAuthenticity.sahih: 'sahih',
};

// Ayah class

// Athar class

// Other class
