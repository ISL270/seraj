// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fire_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireCoachInfo _$FireCoachInfoFromJson(Map<String, dynamic> json) =>
    FireCoachInfo(
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$FireCoachInfoToJson(FireCoachInfo instance) =>
    <String, dynamic>{
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
    };

const _$UserTypeEnumMap = {
  UserType.coach: 'coach',
  UserType.trainee: 'trainee',
};

FireTraineeInfo _$FireTraineeInfoFromJson(Map<String, dynamic> json) =>
    FireTraineeInfo(
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      coachEmail: json['coachEmail'] as String,
    );

Map<String, dynamic> _$FireTraineeInfoToJson(FireTraineeInfo instance) =>
    <String, dynamic>{
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'coachEmail': instance.coachEmail,
    };
