// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daleel_fm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyaFM _$AyaFMFromJson(String docID, Map<String, dynamic> json) => AyaFM(
      id: docID,
      text: json['text'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      sayer: json['sayer'] as String?,
      lastAya: (json['lastAya'] as num?)?.toInt(),
      firstAya: (json['firstAya'] as num?)?.toInt(),
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      surahOfAya: json['surahOfAya'] as String?,
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
      description: json['description'] as String?,
      lastRevisedAt: _fromTimestamp(json['lastRevisedAt'] as Timestamp?),
    );

const _$PriorityEnumMap = {
  Priority.normal: 'normal',
  Priority.high: 'high',
  Priority.urgent: 'urgent',
};

const _$DaleelTypeEnumMap = {
  DaleelType.aya: 'aya',
  DaleelType.hadith: 'hadith',
  DaleelType.athar: 'athar',
  DaleelType.other: 'other',
};

HadithFM _$HadithFMFromJson(String docID, Map<String, dynamic> json) => HadithFM(
      id: docID,
      text: json['text'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
      description: json['description'] as String?,
      lastRevisedAt: _fromTimestamp(json['lastRevisedAt'] as Timestamp?),
      hadithExtraction: json['hadithExtraction'] as String?,
      hadithAuthenticity:
          $enumDecodeNullable(_$HadithAuthenticityEnumMap, json['hadithAuthenticity']),
    );

const _$HadithAuthenticityEnumMap = {
  HadithAuthenticity.sahih: 'sahih',
  HadithAuthenticity.hasan: 'hasan',
  HadithAuthenticity.daif: 'daif',
};

AtharFM _$AtharFMFromJson(String docID, Map<String, dynamic> json) => AtharFM(
      id: docID,
      text: json['text'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
      description: json['description'] as String?,
      lastRevisedAt: _fromTimestamp(json['lastRevisedAt'] as Timestamp?),
    );

OtherFM _$OtherFMFromJson(String docID, Map<String, dynamic> json) => OtherFM(
      id: docID,
      text: json['text'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
      description: json['description'] as String?,
      lastRevisedAt: _fromTimestamp(json['lastRevisedAt'] as Timestamp?),
    );
