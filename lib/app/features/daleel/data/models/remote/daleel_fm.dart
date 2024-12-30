import 'package:athar/app/core/firestore/remote_model.dart';
import 'package:athar/app/features/daleel/domain/models/daleel.dart';
import 'package:athar/app/features/daleel/domain/models/daleel_type.dart';
import 'package:athar/app/features/daleel/domain/models/hadith_type.dart';
import 'package:athar/app/features/daleel/domain/models/priority.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final class DaleelFM implements RemoteModel<Daleel> {
  final String id;
  final String text;
  final String? description;
  final String? sayer;
  final HadithAuthenticity authenticity;
  final Priority priority;
  final String? extraction;
  final List<String> tags;
  final DaleelType daleelType;
  final String? rawi;
  final DateTime? lastRevisedAt;

  DaleelFM({
    required this.id,
    required this.text,
    required this.description,
    required this.sayer,
    required this.extraction,
    required this.tags,
    required this.daleelType,
    required this.rawi,
    required this.lastRevisedAt,
    this.priority = Priority.normal,
    this.authenticity = HadithAuthenticity.sahih,
  });

  @override
  factory DaleelFM.fromJson(String docID, Map<String, dynamic> json) => DaleelFM(
        id: docID,
        text: json['text'] as String,
        description: json['description'] as String?,
        sayer: json['sayer'] as String?,
        authenticity: json['hadithAuthenticityType'] != null
            ? HadithAuthenticity.values.firstWhere(
                (e) => e.name == json['hadithAuthenticityType'] as String,
                orElse: () => HadithAuthenticity.sahih,
              )
            : HadithAuthenticity.sahih,
        priority: json['priority'] != null
            ? Priority.values.firstWhere(
                (e) => e.name == json['priority'] as String,
                orElse: () => Priority.normal,
              )
            : Priority.normal,
        extraction: json['extraction'] as String?,
        tags: [],
        daleelType: json['daleelType'] != null
            ? DaleelType.values.firstWhere(
                (e) => e.name == json['daleelType'] as String,
                orElse: () => DaleelType.hadith,
              )
            : DaleelType.hadith,
        rawi: json['rawi'] as String?,
        lastRevisedAt:
            json['lastRevisedAt'] != null ? (json['lastRevisedAt'] as Timestamp).toDate() : null,
      );

  @override
  Daleel toDomain() => switch (daleelType) {
        DaleelType.hadith => Hadith(
            id: id,
            text: text,
            priotiy: priority,
            description: description,
            authenticity: authenticity,
            extraction: extraction,
            tags: tags,
            lastRevisedAt: lastRevisedAt,
            rawi: rawi,
          ),
      };
}
