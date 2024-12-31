import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';

sealed class Daleel {
  final String id;
  final String text;
  final String? description;
  final String? sayer;
  final Priority priotiy;
  final List<String> tags;
  final DateTime? lastRevisedAt;

  const Daleel({
    required this.id,
    required this.text,
    this.priotiy = Priority.normal,
    this.lastRevisedAt,
    this.tags = const [],
    this.description,
    this.sayer,
  });
}

final class Hadith extends Daleel {
  final String? rawi;
  final String? extraction;
  final HadithAuthenticity? authenticity;

  const Hadith({
    required super.id,
    required super.text,
    super.priotiy,
    super.lastRevisedAt,
    super.tags,
    super.description,
    this.rawi,
    this.extraction,
    this.authenticity,
  });
}

// Ayah class

// Athar class

// Other class
