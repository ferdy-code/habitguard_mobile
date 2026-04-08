import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit.freezed.dart';

enum HabitFrequency { daily, weekly, custom }

@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String userId,
    required String title,
    String? description,
    @Default('⭐') String emoji,
    @Default('#4CAF50') String color,
    @Default(HabitFrequency.daily) HabitFrequency frequency,
    int? customDays,
    @Default(1) int targetCount,
    String? category,
    @Default(false) bool reminderEnabled,
    String? reminderTime,
    @Default(0) int sortOrder,
    @Default(false) bool isArchived,
    @Default(0) int currentStreak,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Habit;
}
