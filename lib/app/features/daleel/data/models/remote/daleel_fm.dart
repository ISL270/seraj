import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_authenticity.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

sealed class DaleelFM implements RemoteModel<Daleel> {
  const DaleelFM();

  factory DaleelFM.fromJson(DaleelType daleelType, Map<String, dynamic> json) =>
      switch (daleelType) { DaleelType.hadith => HadithFM.fromJson(json) };

  factory DaleelFM.fromDaleelType(
    DaleelType daleelType, {
    required String id,
    required String text,
    required String description,
    required String sayer,
    required String extraction,
    required List<String> tags,
    required DateTime lastRevisedAt,
    required Priority priority,
    required HadithAuthenticity authenticity,
  }) =>
      switch (daleelType) {
        DaleelType.hadith => HadithFM(
            id: id,
            text: text,
            description: description,
            sayer: sayer,
            hadithAuthenticity: authenticity,
            priority: priority,
            extraction: extraction,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
          ),
      };

  DaleelFM fromDomain(Daleel daleel) => switch (daleel) {
        Hadith() => HadithFM(
            id: daleel.id,
            text: daleel.text,
            description: daleel.description,
            sayer: daleel.sayer,
            hadithAuthenticity: daleel.hadithAuthenticity,
            priority: daleel.priority,
            extraction: daleel.extraction,
            tags: daleel.tags,
            lastRevisedAt: daleel.lastRevisedAt,
          ),
      };
}

final class HadithFM extends DaleelFM {
  final String id;
  final String text;
  final String? description;
  final String? sayer;
  final HadithAuthenticity? hadithAuthenticity;
  final Priority priority;
  final String? extraction;
  final List<String>? tags;
  final DateTime? lastRevisedAt;

  HadithFM({
    required this.id,
    required this.text,
    required this.description,
    required this.sayer,
    required this.extraction,
    required this.tags,
    required this.lastRevisedAt,
    required this.priority,
    required this.hadithAuthenticity,
  });

  factory HadithFM.fromJson(Map<String, dynamic> json) => HadithFM(
      id: json['id'] as String,
      text: json['text'] as String,
      priority: $enumDecode(priorityEnumMap, json['priority']),
      description: json['description'] as String?,
      extraction: json['extraction'] as String?,
      lastRevisedAt:
          json['lastRevisedAt'] == null ? null : (json['lastRevisedAt'] as Timestamp).toDate(),
      sayer: json['sayer'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
      hadithAuthenticity:
          $enumDecodeNullable(hadithAuthenticityEnumMap, json['hadithAuthenticity']));

  Map<String, dynamic> toJson(Hadith hadith) => HadithFM(
        id: hadith.id,
        text: hadith.text,
        description: hadith.description,
        sayer: hadith.sayer,
        hadithAuthenticity: hadith.hadithAuthenticity,
        priority: hadith.priority,
        extraction: hadith.extraction,
        tags: hadith.tags,
        lastRevisedAt: hadith.lastRevisedAt,
      ).toJson(hadith);

  @override
  Hadith toDomain() => Hadith(
        id: id,
        text: text,
        priority: priority,
        description: description,
        hadithAuthenticity: hadithAuthenticity,
        extraction: extraction,
        tags: tags ?? [],
        lastRevisedAt: lastRevisedAt,
        sayer: sayer,
      );
}
