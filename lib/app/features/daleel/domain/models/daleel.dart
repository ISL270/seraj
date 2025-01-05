import 'package:athar/app/core/models/domain/islamic_text.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:equatable/equatable.dart';

sealed class Daleel extends IslamicText with EquatableMixin {
  final String? sayer;
  final DateTime lastRevisedAt;

  const Daleel({
    required super.id,
    required super.text,
    required this.lastRevisedAt,
    super.priority,
    this.sayer,
    super.description,
    super.tags,
  });
}

final class Hadith extends Daleel {
  final String? extraction;
  final HadithAuthenticity? authenticity;

  const Hadith({
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

  @override
  List<Object?> get props => [
        id,
        text,
        tags,
        lastRevisedAt,
        sayer,
        priority,
        description,
        extraction,
        authenticity,
      ];
}

final class Athar extends Daleel {
  const Athar({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    super.priority,
    super.tags,
    super.description,
    super.sayer,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        tags,
        lastRevisedAt,
        sayer,
        priority,
        description,
      ];
}

final class Aya extends Daleel {
  final String? surahOfAya;
  final String? firstAya;
  final String? lastAya;

  const Aya({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    this.surahOfAya,
    this.firstAya,
    this.lastAya,
    super.priority,
    super.tags,
    super.description,
    super.sayer,
  });

  @override
  List<Object?> get props => [
        id,
        text,
        tags,
        lastRevisedAt,
        sayer,
        priority,
        description,
        surahOfAya,
        firstAya,
        lastAya,
      ];
}
