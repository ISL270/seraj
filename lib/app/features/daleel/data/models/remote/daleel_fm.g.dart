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
      lastRevisedAt:
          json['lastRevisedAt'] == null ? null : DateTime.parse(json['lastRevisedAt'] as String),
      extraction: json['extraction'] as String?,
      authenticity: $enumDecodeNullable(_$HadithAuthenticityEnumMap, json['authenticity']),
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
      'extraction': instance.extraction,
      'authenticity': _$HadithAuthenticityEnumMap[instance.authenticity],
    };

const _$PriorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.normal: 'normal',
};

const _$HadithAuthenticityEnumMap = {
  HadithAuthenticity.daif: 'daif',
  HadithAuthenticity.hasan: 'hasan',
  HadithAuthenticity.sahih: 'sahih',
};

const _$DaleelTypeEnumMap = {
  DaleelType.hadith: 'hadith',
};
