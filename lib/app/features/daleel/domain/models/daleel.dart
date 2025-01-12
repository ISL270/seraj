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

  @override
  List<Object?> get props => [
        super.props,
        sayer,
        lastRevisedAt,
      ];
}

final class Hadith extends Daleel {
  final String? extraction;
  final HadithAuthenticity? authenticity;

  const Hadith({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    super.tags,
    super.sayer,
    super.priority,
    this.extraction,
    super.description,
    this.authenticity,
  });

  @override
  List<Object?> get props => [
        super.props,
        extraction,
        authenticity,
      ];
}

final class Athar extends Daleel {
  const Athar({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    super.tags,
    super.sayer,
    super.priority,
    super.description,
  });
}

final class Others extends Daleel {
  const Others({
    required super.id,
    required super.text,
    required super.lastRevisedAt,
    super.tags,
    super.sayer,
    super.priority,
    super.description,
  });
}
