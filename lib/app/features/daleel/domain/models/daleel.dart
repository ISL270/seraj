import 'package:athar/app/core/models/domain/islamic_text.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';

sealed class Daleel extends IslamicText {
  final String? sayer;
  final DateTime lastRevisedAt;

  const Daleel({
    required super.id,
    required super.text,
    required this.lastRevisedAt,
    this.sayer,
    super.tags,
    super.priority,
    super.description,
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
