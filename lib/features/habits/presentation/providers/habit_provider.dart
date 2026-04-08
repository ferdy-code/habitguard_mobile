import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/remote/habit_remote_source.dart';
import '../../data/repositories/habit_repository_impl.dart';
import '../../domain/entities/completion.dart';
import '../../domain/entities/habit.dart';

// ---------- View-layer data classes ----------

class HabitWithStatus {
  final Habit habit;
  final bool isCompleted;
  final String? completionId;
  final String? note;

  const HabitWithStatus({
    required this.habit,
    required this.isCompleted,
    this.completionId,
    this.note,
  });
}

class HabitDetail {
  final Habit habit;
  final int completionCount7d;
  final int completionCount30d;
  final int totalCompletions;
  final int longestStreak;
  final List<Completion> recentCompletions;
  final List<Completion> heatmapCompletions;

  const HabitDetail({
    required this.habit,
    required this.completionCount7d,
    required this.completionCount30d,
    required this.totalCompletions,
    required this.longestStreak,
    required this.recentCompletions,
    required this.heatmapCompletions,
  });

  double get rate7d => completionCount7d / 7;
  double get rate30d => completionCount30d / 30;
}

// ---------- Infrastructure providers ----------

final _habitRemoteSourceProvider = Provider<HabitRemoteSource>(
  (ref) => HabitRemoteSource(ref.watch(apiClientProvider)),
);

final habitRepositoryProvider = Provider<HabitRepositoryImpl>(
  (ref) => HabitRepositoryImpl(
    ref.watch(habitDaoProvider),
    ref.watch(completionDaoProvider),
    ref.watch(_habitRemoteSourceProvider),
  ),
);

// ---------- State providers ----------

class SelectedDateNotifier extends Notifier<DateTime> {
  @override
  DateTime build() => DateUtils.dateOnly(DateTime.now());

  void setDate(DateTime date) => state = date;
}

final selectedDateProvider = NotifierProvider<SelectedDateNotifier, DateTime>(
  SelectedDateNotifier.new,
);

// ---------- Habits list notifier ----------

class HabitsNotifier extends AsyncNotifier<List<Habit>> {
  HabitRepositoryImpl get _repo => ref.read(habitRepositoryProvider);

  @override
  Future<List<Habit>> build() => _repo.getHabits();

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_repo.getHabits);
  }

  Future<void> createHabit(CreateHabitRequest req) async {
    final userId = ref.read(currentUserProvider)?.id ?? '';
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.createHabit(userId, req);
      return _repo.getHabits();
    });
  }

  Future<void> updateHabit(String id, UpdateHabitRequest req) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.updateHabit(id, req);
      return _repo.getHabits();
    });
  }

  Future<void> archiveHabit(String id) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.archiveHabit(id);
      return _repo.getHabits();
    });
  }

  Future<void> reorder(String habitId, int newIndex) async {
    final current = state.value;
    if (current == null) return;
    // Assign new sortOrder based on new position
    await _repo.reorderHabit(habitId, newIndex);
    state = await AsyncValue.guard(_repo.getHabits);
  }

  Future<void> toggleCompletion(
    String habitId,
    DateTime date, {
    String? note,
  }) async {
    await _repo.toggleCompletion(habitId, date, note: note);
    ref.invalidate(completionsForDateProvider(DateUtils.dateOnly(date)));
    // Refresh to update streak count
    state = await AsyncValue.guard(_repo.getHabits);
  }
}

final habitsListProvider = AsyncNotifierProvider<HabitsNotifier, List<Habit>>(
  HabitsNotifier.new,
);

// ---------- Completions per date ----------

final completionsForDateProvider = FutureProvider.autoDispose
    .family<List<Completion>, DateTime>(
      (ref, date) =>
          ref.watch(habitRepositoryProvider).getCompletionsForDate(date),
    );

// ---------- Habits with status for selected date ----------

final habitsForSelectedDateProvider =
    Provider<AsyncValue<List<HabitWithStatus>>>((ref) {
      final habitsAsync = ref.watch(habitsListProvider);
      final date = ref.watch(selectedDateProvider);
      final completionsAsync = ref.watch(completionsForDateProvider(date));
      final weekday = date.weekday; // 1=Mon, 7=Sun

      return habitsAsync.when(
        loading: () => const AsyncLoading(),
        error: AsyncError.new,
        data: (habits) => completionsAsync.when(
          loading: () => const AsyncLoading(),
          error: AsyncError.new,
          data: (completions) {
            final filtered =
                habits
                    .where((h) => !h.isArchived)
                    .where(
                      (h) => switch (h.frequency) {
                        HabitFrequency.daily => true,
                        HabitFrequency.weekly => true,
                        HabitFrequency.custom => h.customDays == weekday,
                      },
                    )
                    .toList()
                  ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

            return AsyncData(
              filtered.map((h) {
                final c = completions
                    .where((c) => c.habitId == h.id)
                    .firstOrNull;
                return HabitWithStatus(
                  habit: h,
                  isCompleted: c != null,
                  completionId: c?.id,
                  note: c?.note,
                );
              }).toList(),
            );
          },
        ),
      );
    });

// ---------- Habit detail ----------

final habitDetailProvider = FutureProvider.autoDispose
    .family<HabitDetail, String>((ref, habitId) async {
      final repo = ref.watch(habitRepositoryProvider);
      final habit = await repo.getHabitById(habitId);
      if (habit == null) throw Exception('Habit tidak ditemukan');

      final now = DateTime.now();
      final allCompletions = await repo.getAllCompletionsForHabit(habitId);
      allCompletions.sort((a, b) => b.completedAt.compareTo(a.completedAt));

      final last7 = allCompletions
          .where(
            (c) => c.completedAt.isAfter(now.subtract(const Duration(days: 7))),
          )
          .length;
      final last30 = allCompletions
          .where(
            (c) =>
                c.completedAt.isAfter(now.subtract(const Duration(days: 30))),
          )
          .length;
      final heatmap = allCompletions
          .where(
            (c) =>
                c.completedAt.isAfter(now.subtract(const Duration(days: 84))),
          )
          .toList();

      return HabitDetail(
        habit: habit,
        completionCount7d: last7,
        completionCount30d: last30,
        totalCompletions: allCompletions.length,
        longestStreak: _calcLongestStreak(allCompletions),
        recentCompletions: allCompletions.take(20).toList(),
        heatmapCompletions: heatmap,
      );
    });

int _calcLongestStreak(List<Completion> completions) {
  if (completions.isEmpty) return 0;
  final dates =
      completions.map((c) => DateUtils.dateOnly(c.completedAt)).toSet().toList()
        ..sort();
  int longest = 1, current = 1;
  for (int i = 1; i < dates.length; i++) {
    if (dates[i].difference(dates[i - 1]).inDays == 1) {
      current++;
      longest = max(longest, current);
    } else {
      current = 1;
    }
  }
  return longest;
}
