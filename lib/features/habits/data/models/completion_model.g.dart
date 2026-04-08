// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompletionModel _$CompletionModelFromJson(Map<String, dynamic> json) =>
    CompletionModel(
      id: json['id'] as String,
      habitId: json['habitId'] as String,
      completedAt: DateTime.parse(json['completedAt'] as String),
      note: json['note'] as String?,
      count: (json['count'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$CompletionModelToJson(CompletionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'completedAt': instance.completedAt.toIso8601String(),
      'note': instance.note,
      'count': instance.count,
    };
