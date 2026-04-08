import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/screen_time_entry.dart';
import '../providers/screen_time_provider.dart';
import '../widgets/screen_time_bar_chart.dart';

class AppDetailScreen extends ConsumerWidget {
  final String packageName;
  final ScreenTimeEntry? initial;

  const AppDetailScreen({
    super.key,
    required this.packageName,
    this.initial,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = initial?.appName ?? packageName.split('.').last;
    final color = categoryColor(initial?.category ?? 'Lainnya');
    final todayMin = initial?.usageMinutes ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text(appName)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Today summary ────────────────────────────────
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.2)),
            ),
            child: Column(
              children: [
                Text(
                  _formatMinutes(todayMin),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                Text('Penggunaan hari ini',
                    style: Theme.of(context).textTheme.bodySmall),
                const SizedBox(height: 8),
                Chip(
                  label: Text(initial?.category ?? 'Lainnya'),
                  backgroundColor: color.withValues(alpha: 0.15),
                  side: BorderSide.none,
                  labelStyle: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── 7-day usage chart ─────────────────────────────
          Text('Penggunaan 7 Hari Terakhir',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  )),
          const SizedBox(height: 12),
          _AppWeeklyChart(packageName: packageName, color: color),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  String _formatMinutes(int min) {
    if (min >= 60) return '${min ~/ 60}j ${min % 60}m';
    return '${min}m';
  }
}

// ── Weekly bar chart for single app ─────────────────────────────

final _appWeeklyProvider = FutureProvider.autoDispose
    .family<List<_AppDayUsage>, String>((ref, packageName) async {
  final repo = ref.watch(screenTimeRepositoryProvider);
  final now = DateTime.now();
  final start =
      DateTime(now.year, now.month, now.day).subtract(const Duration(days: 6));
  final end = DateTime(now.year, now.month, now.day + 1);
  final entries = await repo.getEntriesForRange(start, end);

  final map = <String, int>{};
  for (final e in entries) {
    if (e.packageName != packageName) continue;
    final key =
        '${e.date.year}-${e.date.month.toString().padLeft(2, '0')}-${e.date.day.toString().padLeft(2, '0')}';
    map[key] = (map[key] ?? 0) + e.usageMinutes;
  }

  final result = <_AppDayUsage>[];
  for (int i = 0; i < 7; i++) {
    final d = start.add(Duration(days: i));
    final key =
        '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
    result.add(_AppDayUsage(date: d, minutes: map[key] ?? 0));
  }
  return result;
});

class _AppDayUsage {
  final DateTime date;
  final int minutes;
  const _AppDayUsage({required this.date, required this.minutes});
}

class _AppWeeklyChart extends ConsumerWidget {
  final String packageName;
  final Color color;

  const _AppWeeklyChart({required this.packageName, required this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(_appWeeklyProvider(packageName));

    return async.when(
      loading: () =>
          const SizedBox(height: 180, child: Center(child: CircularProgressIndicator())),
      error: (e, _) => SizedBox(height: 180, child: Center(child: Text('$e'))),
      data: (data) {
        final maxY = data
                .map((d) => d.minutes)
                .reduce((a, b) => a > b ? a : b)
                .toDouble() *
            1.2;
        final dayFmt = DateFormat('E', 'id');

        return SizedBox(
          height: 180,
          child: BarChart(
            BarChartData(
              maxY: maxY < 10 ? 10 : maxY,
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: maxY / 4,
                getDrawingHorizontalLine: (_) =>
                    const FlLine(color: AppColors.grey200, strokeWidth: 1),
              ),
              titlesData: FlTitlesData(
                topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false)),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 36,
                    getTitlesWidget: (val, _) => Text(
                      '${val.toInt()}m',
                      style: const TextStyle(
                          fontSize: 9, color: AppColors.grey500),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (val, _) {
                      final i = val.toInt();
                      if (i < 0 || i >= data.length) {
                        return const SizedBox.shrink();
                      }
                      return Text(
                        dayFmt.format(data[i].date),
                        style: const TextStyle(
                            fontSize: 9, color: AppColors.grey500),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(
                data.length,
                (i) => BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: data[i].minutes.toDouble(),
                      color: color,
                      width: 18,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                  ],
                ),
              ),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final min = rod.toY.toInt();
                    final label =
                        min >= 60 ? '${min ~/ 60}j ${min % 60}m' : '${min}m';
                    return BarTooltipItem(
                      label,
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
