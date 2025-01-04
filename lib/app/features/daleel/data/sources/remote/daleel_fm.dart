import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daleel_fm.g.dart';

sealed class DaleelFM implements RemoteModel<Daleel> {
  final String id;
  final String text;
  final String? description;
  final Priority priority;
  final String? sayer;
  final List<String> tags;
  final DateTime lastRevisedAt;
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
        DaleelType.athar => AtharFM.fromJson(docID, json),
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
    required DateTime lastRevisedAt,
    required HadithAuthenticity? authenticity,
  }) =>
      switch (daleelType) {
        DaleelType.hadith => HadithFM(
            id: id,
            text: text,
            description: description,
            sayer: sayer,
            hadithAuthenticity: authenticity,
            priority: priority,
            hadithExtraction: extraction,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.hadith,
          ),
        DaleelType.athar => AtharFM(
            id: id,
            text: text,
            description: description,
            sayer: sayer,
            priority: priority,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
            daleelType: DaleelType.athar,
          ),
      };

  DaleelFM fromDomain(Daleel daleel) => switch (daleel) {
        Hadith() => HadithFM(
            id: daleel.id,
            text: daleel.text,
            description: daleel.description,
            sayer: daleel.sayer,
            hadithAuthenticity: daleel.authenticity,
            priority: daleel.priority,
            hadithExtraction: daleel.extraction,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
            daleelType: DaleelType.hadith,
          ),
        Athar() => AtharFM(
            id: daleel.id,
            text: daleel.text,
            description: daleel.description,
            sayer: daleel.sayer,
            priority: daleel.priority,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
            daleelType: DaleelType.athar,
          ),
      };
}

final class HadithFM extends DaleelFM {
  final String? hadithExtraction;
  final HadithAuthenticity? hadithAuthenticity;

  HadithFM({
    required super.id,
    required super.text,
    required super.description,
    required super.sayer,
    required super.priority,
    required super.tags,
    required super.lastRevisedAt,
    required this.hadithExtraction,
    required this.hadithAuthenticity,
    required super.daleelType,
  });

  @override
  Hadith toDomain() => Hadith(
        id: id,
        text: text,
        priority: priority,
        description: description,
        authenticity: hadithAuthenticity,
        extraction: hadithExtraction,
        tags: tags,
        lastRevisedAt: lastRevisedAt,
        sayer: sayer,
      );

  factory HadithFM.fromJson(String docID, Map<String, dynamic> json) =>
      _$HadithFMFromJson(docID, json);
}

final class AtharFM extends DaleelFM {
  const AtharFM({
    required super.id,
    required super.text,
    required super.description,
    required super.sayer,
    required super.priority,
    required super.tags,
    required super.lastRevisedAt,
    required super.daleelType,
  });

  @override
  Athar toDomain() => Athar(
        id: id,
        text: text,
        priority: priority,
        description: description,
        tags: tags,
        lastRevisedAt: lastRevisedAt,
        sayer: sayer,
      );

  factory AtharFM.fromJson(String docID, Map<String, dynamic> json) =>
      _$AtharFMFromJson(docID, json);
}
