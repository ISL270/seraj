// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daleel_fm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

const _$PriorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.normal: 'normal',
};

const _$DaleelTypeEnumMap = {
  DaleelType.hadith: 'hadith',
  DaleelType.aya: 'aya',
};

HadithFM _$HadithFMFromJson(String docID, Map<String, dynamic> json) =>
    HadithFM(
      id: docID,
      text: json['text'] as String,
      description: json['description'] as String?,
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      lastRevisedAt: json['lastRevisedAt'] == null
          ? null
          : (json['lastRevisedAt'] as Timestamp).toDate(),
      hadithExtraction: json['hadithExtraction'] as String?,
      hadithAuthenticity: $enumDecodeNullable(
          _$HadithAuthenticityEnumMap, json['hadithAuthenticity']),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
    );

Map<String, dynamic> _$HadithFMToJson(HadithFM instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'description': instance.description,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'sayer': instance.sayer,
      'tags': instance.tags,
      'lastRevisedAt': instance.lastRevisedAt?.toIso8601String(),
      'daleelType': _$DaleelTypeEnumMap[instance.daleelType]!,
      'hadithExtraction': instance.hadithExtraction,
      'hadithAuthenticity':
          _$HadithAuthenticityEnumMap[instance.hadithAuthenticity],
    };

const _$HadithAuthenticityEnumMap = {
  HadithAuthenticity.daif: 'daif',
  HadithAuthenticity.hasan: 'hasan',
  HadithAuthenticity.sahih: 'sahih',
};

AyaFm _$AyaFmFromJson(String docID, Map<String, dynamic> json) => AyaFm(
      id: docID,
      text: json['text'] as String,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
      lastRevisedAt: json['lastRevisedAt'] == null
          ? null
          : (json['lastRevisedAt'] as Timestamp).toDate(),
      description: json['description'] as String?,
      sayer: json['sayer'] as String?,
      surahOfAya: json['surahOfAya'] as String?,
      nomOfAya: json['nomOfAya'] as String?,
    );

Map<String, dynamic> _$AyaFmToJson(AyaFm instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'description': instance.description,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'sayer': instance.sayer,
      'tags': instance.tags,
      'lastRevisedAt': instance.lastRevisedAt?.toIso8601String(),
      'daleelType': _$DaleelTypeEnumMap[instance.daleelType]!,
      'surahOfAya': instance.surahOfAya,
      'nomOfAya': instance.nomOfAya,
    };
