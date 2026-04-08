// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'focus_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FocusSessionModel _$FocusSessionModelFromJson(Map<String, dynamic> json) =>
    FocusSessionModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: json['type'] as String,
      focusMinutes: (json['focusMinutes'] as num).toInt(),
      breakMinutes: (json['breakMinutes'] as num).toInt(),
      actualFocusSeconds: (json['actualFocusSeconds'] as num?)?.toInt() ?? 0,
      status: json['status'] as String,
      blockedApps: (json['blockedApps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startedAt: DateTime.parse(json['startedAt'] as String),
      endedAt: json['endedAt'] == null
          ? null
          : DateTime.parse(json['endedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FocusSessionModelToJson(FocusSessionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': instance.type,
      'focusMinutes': instance.focusMinutes,
      'breakMinutes': instance.breakMinutes,
      'actualFocusSeconds': instance.actualFocusSeconds,
      'status': instance.status,
      'blockedApps': instance.blockedApps,
      'startedAt': instance.startedAt.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
