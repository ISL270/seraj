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
}

final class Others extends Daleel {
  const Others({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    super.priority,
    super.tags,
    super.description,
    super.sayer,
  });
}
