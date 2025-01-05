import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';

sealed class Daleel {
  final String id;
  final String text;
  final String? description;
  final Priority priority;
  final String? sayer;
  final List<String> tags;
  final DateTime lastRevisedAt;

  const Daleel({
    required this.id,
    required this.text,
    required this.lastRevisedAt,
    this.sayer,
    this.priority = Priority.normal,
    this.tags = const [],
    this.description,
  });
}

final class Hadith extends Daleel {
  final String? extraction;
  final HadithAuthenticity? authenticity;

  Hadith({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    super.priority,
    super.tags,
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
        'lastRevisedAt': hadith.lastRevisedAt.toIso8601String(),
        'sayer': hadith.sayer,
      };
}

final class Athar extends Daleel {
  Athar({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    super.priority,
    super.tags,
    super.description,
    super.sayer,
  });

  Map<String, dynamic> toJson(Athar athar) => <String, dynamic>{
        'id': athar.id,
        'text': athar.text,
        'priotiy': priorityEnumMap[athar.priority],
        'description': athar.description,
        'tags': athar.tags,
        'lastRevisedAt': athar.lastRevisedAt.toIso8601String(),
        'sayer': athar.sayer,
      };
}

final class Others extends Daleel {
  const Others({
    required super.id,
    required super.text,
    super.priority,
    super.tags,
    super.lastRevisedAt,
    super.description,
    super.sayer,
  });

  Map<String, dynamic> toJson(Others others) => <String, dynamic>{
        'id': others.id,
        'text': others.text,
        'priotiy': priorityEnumMap[others.priority],
        'description': others.description,
        'tags': others.tags,
        'lastRevisedAt': others.lastRevisedAt.toIso8601String(),
        'sayer': others.sayer,
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
