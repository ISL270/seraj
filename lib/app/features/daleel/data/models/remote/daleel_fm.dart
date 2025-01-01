import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daleel_fm.g.dart';

sealed class DaleelFM implements RemoteModel<Daleel> {
  final String id;
  final String text;
  final String? description;
  final Priority priority;
  final String? sayer;
  final List<String> tags;
  final DateTime? lastRevisedAt;
  final DaleelType daleelType;

  const DaleelFM({
    required this.id,
    required this.text,
    required this.description,
    required this.sayer,
    required this.priority,
    required this.tags,
    required this.lastRevisedAt,
    required this.daleelType,
  });

  factory DaleelFM.fromJson(String docID, Map<String, dynamic> json) =>
      switch ($enumDecode(_$DaleelTypeEnumMap, json['daleelType'])) {
        DaleelType.hadith => HadithFM.fromJson(docID, json),
      };

  factory DaleelFM.fromDaleelType(
    DaleelType daleelType, {
    required String id,
    required String text,
    required List<String> tags,
    required Priority priority,
    required String? description,
    required String? sayer,
    required String? extraction,
    required DateTime? lastRevisedAt,
    required HadithAuthenticity? authenticity,
  }) =>
      switch (daleelType) {
        DaleelType.hadith => HadithFM(
            id: id,
            text: text,
            description: description,
            sayer: sayer,
            authenticity: authenticity,
            priority: priority,
            extraction: extraction,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.hadith,
          ),
      };

  DaleelFM fromDomain(Daleel daleel) => switch (daleel) {
        Hadith() => HadithFM(
            id: daleel.id,
            text: daleel.text,
            description: daleel.description,
            sayer: daleel.sayer,
            authenticity: daleel.authenticity,
            priority: daleel.priority,
            extraction: daleel.extraction,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
            daleelType: DaleelType.hadith,
          ),
      };
}

@JsonSerializable()
final class HadithFM extends DaleelFM {
  final String? extraction;
  final HadithAuthenticity? authenticity;

  HadithFM({
    required super.id,
    required super.text,
    required super.description,
    required super.sayer,
    required super.priority,
    required super.tags,
    required super.lastRevisedAt,
    required this.extraction,
    required this.authenticity,
    required super.daleelType,
  });

  @override
  Hadith toDomain() => Hadith(
        id: id,
        text: text,
        priority: priority,
        description: description,
        authenticity: authenticity,
        extraction: extraction,
        tags: tags,
        lastRevisedAt: lastRevisedAt,
        sayer: sayer,
      );

  factory HadithFM.fromJson(String docID, Map<String, dynamic> json) =>
      _$HadithFMFromJson(docID, json);

  Map<String, dynamic> toJson() => _$HadithFMToJson(this);
}
