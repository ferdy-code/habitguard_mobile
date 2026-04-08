import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/screen_time_provider.dart';
import '../widgets/category_pie_chart.dart';
import '../widgets/screen_time_bar_chart.dart';
import '../widgets/trend_line_chart.dart';

class ScreenTimeScreen extends ConsumerWidget {
  const ScreenTimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permAsync = ref.watch(hasPermissionProvider);

    return permAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        appBar: AppBar(title: const Text('Screen Time')),
        body: Center(child: Text('Error: $e')),
      ),
      data: (hasPermission) {
        if (!hasPermission) return const _PermissionPrompt();
        return const _ScreenTimeContent();
      },
    );
  }
}

// ── Permission Prompt ──────────────────────────────────────────

class _PermissionPrompt extends ConsumerWidget {
  const _PermissionPrompt();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen Time')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.phone_android, size: 64, color: AppColors.grey400),
              const SizedBox(height: 16),
              Text(
                'Izin Akses Penggunaan',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              const Text(
                'HabitGuard membutuhkan izin untuk memonitor penggunaan aplikasi. '
                'Buka Pengaturan dan aktifkan akses untuk HabitGuard.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                icon: const Icon(Icons.settings),
                label: const Text('Buka Pengaturan'),
                onPressed: () async {
                  await ref
                      .read(screenTimeServiceProvider)
                      .requestPermission();
                  // Re-check after user returns
                  ref.invalidate(hasPermissionProvider);
                },
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => ref.invalidate(hasPermissionProvider),
                child: const Text('Cek ulang'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Main Content ───────────────────────────────────────────────

class _ScreenTimeContent extends ConsumerWidget {
  const _ScreenTimeContent();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usageAsync = ref.watch(todayUsageProvider);
    final totalMinutes = ref.watch(todayTotalMinutesProvider);
    final categories = ref.watch(categoryBreakdownProvider);
    final yesterdayAsync = ref.watch(yesterdayTotalProvider);
    final trendAsync = ref.watch(dailyTotalsProvider(7));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen Time'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Batas Penggunaan',
            onPressed: () => context.push('/screen-time/limits'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(todayUsageProvider.notifier).refresh(),
        child: usageAsync.when(
          loading: () =>
              const Center(child: CircularProgressIndicator()),
          error: (e, _) => ListView(
            children: [
              const SizedBox(height: 100),
              Center(child: Text('Error: $e')),
              const SizedBox(height: 12),
              Center(
                child: FilledButton(
                  onPressed: () =>
                      ref.read(todayUsageProvider.notifier).refresh(),
                  child: const Text('Coba lagi'),
                ),
              ),
            ],
          ),
          data: (entries) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              // ── Header total ──────────────────────────────
              _TotalHeader(
                totalMinutes: totalMinutes,
                yesterdayAsync: yesterdayAsync,
              ),
              const SizedBox(height: 24),

              // ── Top 5 Apps ────────────────────────────────
              Text('Top Aplikasi',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      )),
              const SizedBox(height: 12),
              ScreenTimeBarChart(
                entries: entries,
                onTap: (entry) => context.push(
                  '/screen-time/app/${Uri.encodeComponent(entry.packageName)}',
                  extra: entry,
                ),
              ),
              const SizedBox(height: 24),

              // ── Category Pie ──────────────────────────────
              Text('Kategori',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      )),
              const SizedBox(height: 12),
              CategoryPieChart(data: categories),
              const SizedBox(height: 24),

              // ── Trend 7 days ──────────────────────────────
              Text('Tren 7 Hari',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      )),
              const SizedBox(height: 12),
              trendAsync.when(
                loading: () => const SizedBox(
                  height: 180,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (e, _) =>
                    SizedBox(height: 180, child: Center(child: Text('$e'))),
                data: (totals) => TrendLineChart(data: totals),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Total Header ───────────────────────────────────────────────

class _TotalHeader extends StatelessWidget {
  final int totalMinutes;
  final AsyncValue<int> yesterdayAsync;

  const _TotalHeader({
    required this.totalMinutes,
    required this.yesterdayAsync,
  });

  @override
  Widget build(BuildContext context) {
    final hours = totalMinutes ~/ 60;
    final mins = totalMinutes % 60;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.secondary, AppColors.secondaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text('Hari Ini',
              style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 4),
          Text(
            '${hours}j ${mins}m',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          yesterdayAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
            data: (yesterdayTotal) {
              if (yesterdayTotal == 0) return const SizedBox.shrink();
              final diff = totalMinutes - yesterdayTotal;
              final pct =
                  (diff.abs() / yesterdayTotal * 100).round();
              final isUp = diff > 0;

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isUp ? Icons.arrow_upward : Icons.arrow_downward,
                      size: 14,
                      color: isUp
                          ? const Color(0xFFFF8A80)
                          : const Color(0xFFA5D6A7),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$pct% vs kemarin',
                      style: TextStyle(
                        color: isUp
                            ? const Color(0xFFFF8A80)
                            : const Color(0xFFA5D6A7),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
