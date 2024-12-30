// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_daleel_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireHadithInfo _$FireHadithInfoFromJson(Map<String, dynamic> json) =>
    FireHadithInfo(
      id: json['id'] as String,
      text: json['text'] as String,
      authenticity: $enumDecodeNullable(
          _$HadithAuthenticityEnumMap, json['authenticity']),
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
      rawi: json['rawi'] as String?,
      extraction: json['extraction'] as String?,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      lastRevisedAt: DateTime.parse(json['lastRevisedAt'] as String),
    );

Map<String, dynamic> _$FireHadithInfoToJson(FireHadithInfo instance) =>
    <String, dynamic>{
      'rawi': instance.rawi,
      'extraction': instance.extraction,
      'authenticity': _$HadithAuthenticityEnumMap[instance.authenticity],
      'id': instance.id,
      'daleelType': _$DaleelTypeEnumMap[instance.daleelType]!,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'text': instance.text,
      'tags': instance.tags,
      'lastRevisedAt': instance.lastRevisedAt.toIso8601String(),
    };

const _$HadithAuthenticityEnumMap = {
  HadithAuthenticity.daif: 'daif',
  HadithAuthenticity.hasan: 'hasan',
  HadithAuthenticity.sahih: 'sahih',
};

const _$PriorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.normal: 'normal',
};

const _$DaleelTypeEnumMap = {
  DaleelType.hadith: 'hadith',
};
