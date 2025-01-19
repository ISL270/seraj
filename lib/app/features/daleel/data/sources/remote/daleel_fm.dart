import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daleel_fm.g.dart';

DateTime _fromTimestamp(Timestamp? timestamp) =>
    timestamp != null ? timestamp.toDate() : DateTime.now();

sealed class DaleelFM implements RemoteModel<Daleel> {
  final String id;
  final String text;
  final String? sayer;
  final List<String> tags;
  final Priority priority;
  final String? description;
  final DaleelType daleelType;
  @JsonKey(fromJson: _fromTimestamp)
  final DateTime? lastRevisedAt;

  const DaleelFM({
    required this.id,
    required this.text,
    required this.tags,
    required this.sayer,
    required this.priority,
    required this.daleelType,
    required this.description,
    required this.lastRevisedAt,
  });

  factory DaleelFM.fromJson(String docID, Map<String, dynamic> json) =>
      switch ($enumDecode(_$DaleelTypeEnumMap, json['daleelType'])) {
        DaleelType.aya => AyaFM.fromJson(docID, json),
        DaleelType.hadith => HadithFM.fromJson(docID, json),
        DaleelType.athar => AtharFM.fromJson(docID, json),
        DaleelType.other => OtherFM.fromJson(docID, json),
      };

  factory DaleelFM.fromDaleelType(
    DaleelType daleelType, {
    required String id,
    required String text,
    required int? lastAya,
    required int? firstAya,
    required String? sayer,
    required List<String> tags,
    required Priority priority,
    required String? extraction,
    required String? surahOfAya,
    required String? description,
    required DateTime lastRevisedAt,
    required HadithAuthenticity? authenticity,
  }) =>
      switch (daleelType) {
        DaleelType.aya => AyaFM(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            lastAya: lastAya,
            priority: priority,
            firstAya: firstAya,
            surahOfAya: surahOfAya,
            description: description,
            daleelType: DaleelType.aya,
            lastRevisedAt: lastRevisedAt,
          ),
        DaleelType.hadith => HadithFM(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            hadithExtraction: extraction,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.hadith,
            hadithAuthenticity: authenticity,
          ),
        DaleelType.athar => AtharFM(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.athar,
          ),
        DaleelType.other => OtherFM(
            id: id,
            text: text,
            tags: tags,
            sayer: sayer,
            priority: priority,
            description: description,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.other,
          ),
      };

  DaleelFM fromDomain(Daleel daleel) => switch (daleel) {
        Aya() => AyaFM(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            sayer: daleel.sayer,
            lastAya: daleel.lastAya,
            surahOfAya: daleel.surah,
            priority: daleel.priority,
            firstAya: daleel.firstAya,
            daleelType: DaleelType.aya,
            description: daleel.description,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
        Hadith() => HadithFM(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            sayer: daleel.sayer,
            priority: daleel.priority,
            daleelType: DaleelType.hadith,
            description: daleel.description,
            hadithExtraction: daleel.extraction,
            lastRevisedAt: daleel.lastRevisedAt,
            hadithAuthenticity: daleel.authenticity,
          ),
        Athar() => AtharFM(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            sayer: daleel.sayer,
            priority: daleel.priority,
            daleelType: DaleelType.athar,
            description: daleel.description,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
        Other() => OtherFM(
            id: daleel.id,
            text: daleel.text,
            tags: daleel.tags,
            sayer: daleel.sayer,
            priority: daleel.priority,
            daleelType: DaleelType.other,
            description: daleel.description,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
      };
}

@JsonSerializable(createToJson: false)
final class AyaFM extends DaleelFM {
  final String? surahOfAya;
  final int? firstAya;
  final int? lastAya;

  const AyaFM({
    required super.id,
    required super.text,
    required super.tags,
    required super.sayer,
    required this.lastAya,
    required this.firstAya,
    required super.priority,
    required this.surahOfAya,
    required super.daleelType,
    required super.description,
    required super.lastRevisedAt,
  });

  @override
  Aya toDomain() => Aya(
        id: id,
        text: text,
        tags: tags,
        sayer: sayer,
        lastAya: lastAya,
        surah: surahOfAya!,
        priority: priority,
        firstAya: firstAya!,
        description: description,
        lastRevisedAt: lastRevisedAt ?? DateTime.now(),
      );

  factory AyaFM.fromJson(String docID, Map<String, dynamic> json) => _$AyaFMFromJson(docID, json);
}

@JsonSerializable(createToJson: false)
final class HadithFM extends DaleelFM {
  final String? hadithExtraction;
  final HadithAuthenticity? hadithAuthenticity;

  HadithFM({
    required super.id,
    required super.text,
    required super.tags,
    required super.sayer,
    required super.priority,
    required super.daleelType,
    required super.description,
    required super.lastRevisedAt,
    required this.hadithExtraction,
    required this.hadithAuthenticity,
  });

  @override
  Hadith toDomain() => Hadith(
        id: id,
        text: text,
        tags: tags,
        sayer: sayer,
        priority: priority,
        description: description,
        extraction: hadithExtraction,
        authenticity: hadithAuthenticity,
        lastRevisedAt: lastRevisedAt ?? DateTime.now(),
      );

  factory HadithFM.fromJson(String docID, Map<String, dynamic> json) =>
      _$HadithFMFromJson(docID, json);
}

@JsonSerializable(createToJson: false)
final class AtharFM extends DaleelFM {
  const AtharFM({
    required super.id,
    required super.text,
    required super.tags,
    required super.sayer,
    required super.priority,
    required super.daleelType,
    required super.description,
    required super.lastRevisedAt,
  });

  @override
  Athar toDomain() => Athar(
        id: id,
        text: text,
        tags: tags,
        sayer: sayer,
        priority: priority,
        description: description,
        lastRevisedAt: lastRevisedAt ?? DateTime.now(),
      );

  factory AtharFM.fromJson(String docID, Map<String, dynamic> json) =>
      _$AtharFMFromJson(docID, json);
}

@JsonSerializable(createToJson: false)
class OtherFM extends DaleelFM {
  OtherFM({
    required super.id,
    required super.text,
    required super.tags,
    required super.sayer,
    required super.priority,
    required super.daleelType,
    required super.description,
    required super.lastRevisedAt,
  });

  @override
  Other toDomain() => Other(
        id: id,
        text: text,
        tags: tags,
        sayer: sayer,
        priority: priority,
        description: description,
        lastRevisedAt: lastRevisedAt ?? DateTime.now(),
      );

  factory OtherFM.fromJson(String docID, Map<String, dynamic> json) =>
      _$OtherFMFromJson(docID, json);
}
