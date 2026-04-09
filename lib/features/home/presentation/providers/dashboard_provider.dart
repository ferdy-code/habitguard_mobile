import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_client.dart';
import '../../../habits/presentation/providers/habit_provider.dart';
import '../../../screen_time/presentation/providers/screen_time_provider.dart';
import '../../../focus/presentation/providers/focus_provider.dart';

// ── Models ──────────────────────────────────────────────────────

class DailySummary {
  final String? aiInsight;
  final int completedHabits;
  final int totalHabits;
  final int totalFocusMinutes;

  const DailySummary({
    this.aiInsight,
    required this.completedHabits,
    required this.totalHabits,
    required this.totalFocusMinutes,
  });

  double get completionRate =>
      totalHabits == 0 ? 0 : completedHabits / totalHabits;

  factory DailySummary.fromJson(Map<String, dynamic> json) => DailySummary(
        aiInsight: json['aiInsight'] as String?,
        completedHabits: (json['completedHabits'] as num?)?.toInt() ?? 0,
        totalHabits: (json['totalHabits'] as num?)?.toInt() ?? 0,
        totalFocusMinutes: (json['totalFocusMinutes'] as num?)?.toInt() ?? 0,
      );

  factory DailySummary.empty() => const DailySummary(
        completedHabits: 0,
        totalHabits: 0,
        totalFocusMinutes: 0,
      );
}

class CorrelationData {
  final bool hasEnoughData;
  final double screenTimeReductionPercent;

  const CorrelationData({
    required this.hasEnoughData,
    required this.screenTimeReductionPercent,
  });

  factory CorrelationData.fromJson(Map<String, dynamic> json) =>
      CorrelationData(
        hasEnoughData: (json['hasEnoughData'] as bool?) ?? false,
        screenTimeReductionPercent:
            (json['screenTimeReductionPercent'] as num?)?.toDouble() ?? 0,
      );
}

// ── Today summary (from backend daily-summaries) ─────────────────

final todaySummaryProvider = FutureProvider<DailySummary>((ref) async {
  final dio = ref.watch(apiClientProvider);
  try {
    final res = await dio.get(ApiEndpoints.todaySummary);
    final data = (res.data as Map<String, dynamic>)['data'];
    if (data == null) return DailySummary.empty();
    return DailySummary.fromJson(data as Map<String, dynamic>);
  } catch (e) {
    log('todaySummaryProvider error: $e');
    // Derive locally from habits + focus providers
    return _buildLocalSummary(ref);
  }
});

DailySummary _buildLocalSummary(Ref ref) {
  final habitsAsync = ref.read(habitsForSelectedDateProvider);
  final habitData = habitsAsync.asData?.value ?? [];
  final completed = habitData.where((h) => h.isCompleted).length;
  final total = habitData.length;

  final focusSessions = ref.read(focusHistoryProvider).asData?.value ?? [];
  final today = DateUtils.dateOnly(DateTime.now());
  final todayFocusSecs = focusSessions
      .where((s) => DateUtils.dateOnly(s.startedAt) == today)
      .fold<int>(0, (sum, s) => sum + s.actualFocusSeconds);

  return DailySummary(
    completedHabits: completed,
    totalHabits: total,
    totalFocusMinutes: todayFocusSecs ~/ 60,
  );
}

// ── Correlation ──────────────────────────────────────────────────

final correlationProvider = FutureProvider<CorrelationData?>((ref) async {
  final dio = ref.watch(apiClientProvider);
  try {
    final res = await dio.get(ApiEndpoints.screenTimeCorrelation);
    final data = (res.data as Map<String, dynamic>)['data'];
    if (data == null) return null;
    return CorrelationData.fromJson(data as Map<String, dynamic>);
  } catch (e) {
    log('correlationProvider error: $e');
    return null;
  }
});

// ── Quick habits (top 3 incomplete today) ───────────────────────

final quickHabitsProvider = Provider<AsyncValue<List<HabitWithStatus>>>((ref) {
  final all = ref.watch(habitsForSelectedDateProvider);
  return all.whenData(
    (list) => list.where((h) => !h.isCompleted).take(3).toList(),
  );
});

// ── Habit summary counts ─────────────────────────────────────────

final habitSummaryProvider = Provider<({int completed, int total})>((ref) {
  final all = ref.watch(habitsForSelectedDateProvider).asData?.value ?? [];
  return (completed: all.where((h) => h.isCompleted).length, total: all.length);
});

// ── Screen time vs limit ─────────────────────────────────────────

class ScreenTimeVsLimit {
  final int usageMinutes;
  final int limitMinutes; // 0 means no limit set
  double get ratio => limitMinutes == 0 ? 0 : usageMinutes / limitMinutes;

  const ScreenTimeVsLimit({
    required this.usageMinutes,
    required this.limitMinutes,
  });
}

final screenTimeVsLimitProvider = Provider<ScreenTimeVsLimit>((ref) {
  final usage = ref.watch(todayTotalMinutesProvider);
  final limits = ref.watch(limitsProvider).asData?.value ?? [];
  // Sum all category limits as a global limit proxy, or 0 if none set
  final totalLimit = limits.fold<int>(
    0,
    (sum, l) => sum + l.dailyLimitMinutes,
  );
  return ScreenTimeVsLimit(usageMinutes: usage, limitMinutes: totalLimit);
});

// ── Focus today ──────────────────────────────────────────────────

final focusTodayMinutesProvider = Provider<int>((ref) {
  final sessions = ref.watch(focusHistoryProvider).asData?.value ?? [];
  final today = DateUtils.dateOnly(DateTime.now());
  return sessions
          .where((s) => DateUtils.dateOnly(s.startedAt) == today)
          .fold<int>(0, (sum, s) => sum + s.actualFocusSeconds) ~/
      60;
});

// ── Top streaks ──────────────────────────────────────────────────

final topStreakHabitsProvider = Provider<List<HabitWithStatus>>((ref) {
  final all = ref.watch(habitsForSelectedDateProvider).asData?.value ?? [];
  final sorted = [...all]
    ..sort((a, b) => b.habit.currentStreak.compareTo(a.habit.currentStreak));
  return sorted.take(3).toList();
});
