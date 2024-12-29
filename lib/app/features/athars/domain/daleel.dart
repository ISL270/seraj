enum Priotiy { urgent, high, normal }

sealed class Daleel {
  final String id;
  final String text;
  final String? description;
  final String? sayer;
  final Priotiy priotiy;
  final List<String> tags;
  final DateTime? lastRevisedAt;

  const Daleel({
    required this.id,
    required this.text,
    required this.priotiy,
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
    required super.text,
    required super.id,
    required super.priotiy,
    required super.tags,
    required super.lastRevisedAt,
    this.rawi,
    this.extraction,
    this.authenticity,
  });
}

enum HadithAuthenticity { sahih, hasan, daif }

// Ayah class

// Athar class

// Other class
