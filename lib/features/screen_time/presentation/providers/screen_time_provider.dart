import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/network/api_client.dart';
import '../../data/remote/screen_time_remote_source.dart';
import '../../data/repositories/screen_time_repository_impl.dart';
import '../../domain/entities/screen_time_entry.dart';
import '../../services/screen_time_service.dart';

// ── Infrastructure ──────────────────────────────────────────────

final screenTimeServiceProvider = Provider<ScreenTimeService>(
  (ref) => ScreenTimeService(),
);

final _screenTimeRemoteProvider = Provider<ScreenTimeRemoteSource>(
  (ref) => ScreenTimeRemoteSource(ref.watch(apiClientProvider)),
);

final screenTimeRepositoryProvider = Provider<ScreenTimeRepositoryImpl>(
  (ref) => ScreenTimeRepositoryImpl(
    ref.watch(screenTimeDaoProvider),
    ref.watch(_screenTimeRemoteProvider),
    ref.watch(screenTimeServiceProvider),
  ),
);

// ── Permission ──────────────────────────────────────────────────

final hasPermissionProvider = FutureProvider<bool>((ref) async {
  return ref.watch(screenTimeServiceProvider).hasPermission();
});

// ── Today usage (sync + fetch) ──────────────────────────────────

class TodayUsageNotifier extends AsyncNotifier<List<ScreenTimeEntry>> {
  @override
  Future<List<ScreenTimeEntry>> build() async {
    return ref.read(screenTimeRepositoryProvider).syncAndGetToday();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(screenTimeRepositoryProvider).syncAndGetToday(),
    );
  }
}

final todayUsageProvider =
    AsyncNotifierProvider<TodayUsageNotifier, List<ScreenTimeEntry>>(
  TodayUsageNotifier.new,
);

// ── Total today ─────────────────────────────────────────────────

final todayTotalMinutesProvider = Provider<int>((ref) {
  final usage = ref.watch(todayUsageProvider).asData?.value;
  if (usage == null) return 0;
  return usage.fold<int>(0, (sum, e) => sum + e.usageMinutes);
});

// ── Yesterday total (for comparison) ────────────────────────────

final yesterdayTotalProvider = FutureProvider<int>((ref) async {
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  final start = DateTime(yesterday.year, yesterday.month, yesterday.day);
  final entries =
      await ref.read(screenTimeRepositoryProvider).getEntriesForDate(start);
  return entries.fold<int>(0, (sum, e) => sum + e.usageMinutes);
});

// ── Category breakdown ──────────────────────────────────────────

final categoryBreakdownProvider = Provider<List<CategoryBreakdown>>((ref) {
  final usage = ref.watch(todayUsageProvider).asData?.value;
  if (usage == null || usage.isEmpty) return [];

  final map = <String, int>{};
  for (final e in usage) {
    map[e.category] = (map[e.category] ?? 0) + e.usageMinutes;
  }

  final total = map.values.fold<int>(0, (a, b) => a + b);
  if (total == 0) return [];

  final list = map.entries
      .map((e) => CategoryBreakdown(
            category: e.key,
            totalMinutes: e.value,
            percentage: e.value / total * 100,
          ))
      .toList()
    ..sort((a, b) => b.totalMinutes.compareTo(a.totalMinutes));

  return list;
});

// ── Daily totals (7 days) ───────────────────────────────────────

final dailyTotalsProvider =
    FutureProvider.autoDispose.family<List<DailyTotal>, int>(
  (ref, days) => ref.watch(screenTimeRepositoryProvider).getDailyTotals(days),
);

// ── Limits ──────────────────────────────────────────────────────

class LimitsNotifier extends AsyncNotifier<List<ScreenTimeLimit>> {
  @override
  Future<List<ScreenTimeLimit>> build() async {
    return ref.read(screenTimeRepositoryProvider).getLimits();
  }

  Future<void> addLimit({
    String? packageName,
    String? category,
    required int dailyLimitMinutes,
  }) async {
    await ref.read(screenTimeRepositoryProvider).createLimit(
          packageName: packageName,
          category: category,
          dailyLimitMinutes: dailyLimitMinutes,
        );
    state = await AsyncValue.guard(
      () => ref.read(screenTimeRepositoryProvider).getLimits(),
    );
  }

  Future<void> removeLimit(String id) async {
    await ref.read(screenTimeRepositoryProvider).deleteLimit(id);
    state = await AsyncValue.guard(
      () => ref.read(screenTimeRepositoryProvider).getLimits(),
    );
  }
}

final limitsProvider =
    AsyncNotifierProvider<LimitsNotifier, List<ScreenTimeLimit>>(
  LimitsNotifier.new,
);
