// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dua_firestore_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuaFM _$DuaFMFromJson(String docID, Map<String, dynamic> json) => DuaFM(
      id: docID,
      text: json['text'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      reward: json['reward'] as String?,
      isFavourite: json['isFavourite'] as bool,
      description: json['description'] as String?,
    );
