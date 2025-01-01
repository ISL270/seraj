// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dua_firestore_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuaFM _$DuaFMFromJson(String docID, Map<String, dynamic> json) => DuaFM(
      id: docID,
      dua: json['dua'] as String,
      priority: $enumDecode(_$PriorityEnumMap, json['priority']),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      reward: json['reward'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DuaFMToJson(DuaFM instance) => <String, dynamic>{
      'id': instance.id,
      'dua': instance.dua,
      'reward': instance.reward,
      'priority': _$PriorityEnumMap[instance.priority]!,
      'tags': instance.tags,
      'description': instance.description,
    };

const _$PriorityEnumMap = {
  Priority.urgent: 'urgent',
  Priority.high: 'high',
  Priority.normal: 'normal',
};
