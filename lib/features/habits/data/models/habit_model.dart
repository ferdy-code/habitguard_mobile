import 'package:drift/drift.dart' hide JsonKey;
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/habit.dart';
import '../../../../core/database/app_database.dart';

part 'habit_model.g.dart';

@JsonSerializable()
class HabitModel {
  final String id;
  final String userId;
  final String title;
  final String? description;
  @JsonKey(name: 'icon')
  final String emoji;
  final String color;
  final String frequency;
  final int? customDays;
  @JsonKey(defaultValue: 1)
  final int targetCount;
  final String? category;
  @JsonKey(defaultValue: false)
  final bool reminderEnabled;
  final String? reminderTime;
  @JsonKey(defaultValue: 0)
  final int sortOrder;
  @JsonKey(defaultValue: false)
  final bool isArchived;
  @JsonKey(defaultValue: 0)
  final int currentStreak;
  final DateTime createdAt;
  final DateTime updatedAt;

  const HabitModel({
    required this.id,
    required this.userId,
    required this.title,
    this.description,
    required this.emoji,
    required this.color,
    required this.frequency,
    this.customDays,
    required this.targetCount,
    this.category,
    required this.reminderEnabled,
    this.reminderTime,
    required this.sortOrder,
    required this.isArchived,
    required this.currentStreak,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HabitModel.fromJson(Map<String, dynamic> json) =>
      _$HabitModelFromJson(json);

  Map<String, dynamic> toJson() => _$HabitModelToJson(this);

  Habit toEntity() => Habit(
    id: id,
    userId: userId,
    title: title,
    description: description,
    emoji: emoji,
    color: color,
    frequency: HabitFrequency.values.firstWhere(
      (e) => e.name == frequency,
      orElse: () => HabitFrequency.daily,
    ),
    customDays: customDays,
    targetCount: targetCount,
    category: category,
    reminderEnabled: reminderEnabled,
    reminderTime: reminderTime,
    sortOrder: sortOrder,
    isArchived: isArchived,
    currentStreak: currentStreak,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  LocalHabitsCompanion toLocalCompanion() => LocalHabitsCompanion(
    id: Value(id),
    userId: Value(userId),
    title: Value(title),
    description: Value(description),
    emoji: Value(emoji),
    color: Value(color),
    frequency: Value(frequency),
    customDays: Value(customDays?.toString()),
    targetCount: Value(targetCount),
    category: Value(category),
    reminderEnabled: Value(reminderEnabled),
    reminderTime: Value(reminderTime),
    sortOrder: Value(sortOrder),
    isArchived: Value(isArchived),
    isSynced: const Value(true),
    createdAt: Value(createdAt),
    updatedAt: Value(updatedAt),
  );
}
