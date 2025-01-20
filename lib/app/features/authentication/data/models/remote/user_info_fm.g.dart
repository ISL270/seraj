// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_fm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFM _$UserFMFromJson(Map<String, dynamic> json) => UserFM(
      id: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UserFMToJson(UserFM instance) => <String, dynamic>{
      'uid': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
