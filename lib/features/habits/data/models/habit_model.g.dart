// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) => HabitModel(
  id: json['id'] as String,
  userId: json['userId'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  emoji: json['icon'] as String,
  color: json['color'] as String,
  frequency: json['frequency'] as String,
  customDays: (json['customDays'] as num?)?.toInt(),
  targetCount: (json['targetCount'] as num?)?.toInt() ?? 1,
  category: json['category'] as String?,
  reminderEnabled: json['reminderEnabled'] as bool? ?? false,
  reminderTime: json['reminderTime'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
  isArchived: json['isArchived'] as bool? ?? false,
  currentStreak: (json['currentStreak'] as num?)?.toInt() ?? 0,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$HabitModelToJson(HabitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'icon': instance.emoji,
      'color': instance.color,
      'frequency': instance.frequency,
      'customDays': instance.customDays,
      'targetCount': instance.targetCount,
      'category': instance.category,
      'reminderEnabled': instance.reminderEnabled,
      'reminderTime': instance.reminderTime,
      'sortOrder': instance.sortOrder,
      'isArchived': instance.isArchived,
      'currentStreak': instance.currentStreak,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
