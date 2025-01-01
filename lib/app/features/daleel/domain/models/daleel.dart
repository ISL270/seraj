import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
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
  final HadithAuthenticity? authenticity;

  const Hadith({
    required super.id,
    required super.text,
    super.priority,
    super.tags,
    super.lastRevisedAt,
    super.description,
    super.sayer,
    this.extraction,
    this.authenticity,
  });

  Map<String, dynamic> toJson(Hadith hadith) => <String, dynamic>{
        'id': hadith.id,
        'text': hadith.text,
        'priotiy': priorityEnumMap[hadith.priority],
        'description': hadith.description,
        'authenticity': authenticityEnumMap[hadith.authenticity],
        'extraction': hadith.extraction,
        'tags': hadith.tags,
        'lastRevisedAt': hadith.lastRevisedAt?.toIso8601String(),
        'sayer': hadith.sayer,
      };
}

final class Aya extends Daleel {
  final String? surahOfAya;
  final String? nomOfAya;

  const Aya({
    required super.id,
    required super.text,
    this.surahOfAya,
    this.nomOfAya,
    super.priority,
    super.tags,
    super.lastRevisedAt,
    super.description,
    super.sayer,
  });
  Map<String, dynamic> toJson(Aya aya) => <String, dynamic>{
        'id': aya.id,
        'text': aya.text,
        'priotiy': priorityEnumMap[aya.priority],
        'description': aya.description,
        'tags': aya.tags,
        'lastRevisedAt': aya.lastRevisedAt?.toIso8601String(),
        'sayer': aya.sayer,
        'surahOfAya': aya.surahOfAya,
        'nomOfAya': aya.nomOfAya,
      };
}

Map<Priority, String> priorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.normal: 'normal',
};
Map<HadithAuthenticity, String> authenticityEnumMap = {
  HadithAuthenticity.daif: 'daif',
  HadithAuthenticity.hasan: 'hasan',
  HadithAuthenticity.sahih: 'sahih',
};

// Ayah class

// Athar class

// Other class
