part of 'daleel_fm.dart';

HadithFM _$HadithFMFromJson(String docID, Map<String, dynamic> json) => HadithFM(
      id: docID,
      text: json['text'] as String,
      description: json['description'] as String?,
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      lastRevisedAt:
          json['lastRevisedAt'] == null ? null : (json['lastRevisedAt'] as Timestamp).toDate(),
      hadithExtraction: json['hadithExtraction'] as String?,
      hadithAuthenticity:
          $enumDecodeNullable(_$HadithAuthenticityEnumMap, json['hadithAuthenticity']),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
    );

OthersFM _$OthersFMFromJson(String docID, Map<String, dynamic> json) => OthersFM(
      id: docID,
      text: json['text'] as String,
      description: json['description'] as String?,
      sayer: json['sayer'] as String?,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      lastRevisedAt:
          json['lastRevisedAt'] == null ? null : (json['lastRevisedAt'] as Timestamp).toDate(),
      daleelType: $enumDecode(_$DaleelTypeEnumMap, json['daleelType']),
    );

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
  DaleelType.others: 'others',
};
