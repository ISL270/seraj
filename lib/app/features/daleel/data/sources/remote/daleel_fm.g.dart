// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daleel_fm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HadithFM _$HadithFMFromJson(String docID, Map<String, dynamic> json) => HadithFM(
      id: docID,
      text: json['text'] as String,
      description: json['description'] as String?,
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      lastRevisedAt: (json['lastRevisedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      hadithExtraction: json['hadithExtraction'] as String?,
      hadithAuthenticity:
          $enumDecodeNullable(_$HadithAuthenticityEnumMap, json['hadithAuthenticity']),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
    );

const _$PriorityEnumMap = {
  Priority.normal: 'normal',
  Priority.high: 'high',
  Priority.urgent: 'urgent',
};

const _$HadithAuthenticityEnumMap = {
  HadithAuthenticity.daif: 'daif',
  HadithAuthenticity.hasan: 'hasan',
  HadithAuthenticity.sahih: 'sahih',
};

const _$DaleelTypeEnumMap = {
  DaleelType.hadith: 'hadith',
  DaleelType.athar: 'athar',
};

AtharFM _$AtharFMFromJson(String docID, Map<String, dynamic> json) => AtharFM(
      id: docID,
      text: json['text'] as String,
      description: json['description'] as String?,
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      lastRevisedAt: (json['lastRevisedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
    );
