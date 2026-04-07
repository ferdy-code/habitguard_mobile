// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  avatarUrl: json['avatarUrl'] as String?,
  timezone: json['timezone'] as String,
  dailyScreenLimitMinutes: (json['dailyScreenLimitMinutes'] as num?)?.toInt(),
  onboardingCompleted: json['onboardingCompleted'] as bool,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'displayName': instance.displayName,
  'avatarUrl': instance.avatarUrl,
  'timezone': instance.timezone,
  'dailyScreenLimitMinutes': instance.dailyScreenLimitMinutes,
  'onboardingCompleted': instance.onboardingCompleted,
};
