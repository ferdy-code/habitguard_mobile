import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/screen_time_entry.dart';

class TrendLineChart extends StatelessWidget {
  final List<DailyTotal> data;

  const TrendLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return const SizedBox(
        height: 180,
        child: Center(child: Text('Belum ada data')),
      );
    }

    final maxY = data
            .map((d) => d.totalMinutes)
            .reduce((a, b) => a > b ? a : b)
            .toDouble() *
        1.2;
    final dayFmt = DateFormat('E', 'id');

    return SizedBox(
      height: 180,
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: maxY < 10 ? 10 : maxY,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: maxY / 4,
            getDrawingHorizontalLine: (_) => const FlLine(
              color: AppColors.grey200,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 36,
                getTitlesWidget: (val, _) => Text(
                  '${val.toInt()}m',
                  style: const TextStyle(fontSize: 9, color: AppColors.grey500),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (val, _) {
                  final i = val.toInt();
                  if (i < 0 || i >= data.length) return const SizedBox.shrink();
                  return Text(
                    dayFmt.format(data[i].date),
                    style:
                        const TextStyle(fontSize: 9, color: AppColors.grey500),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(data.length,
                  (i) => FlSpot(i.toDouble(), data[i].totalMinutes.toDouble())),
              isCurved: true,
              curveSmoothness: 0.3,
              color: AppColors.secondary,
              barWidth: 2.5,
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, _, __, ___) => FlDotCirclePainter(
                  radius: 3,
                  color: AppColors.secondary,
                  strokeWidth: 0,
                ),
              ),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.secondary.withValues(alpha: 0.1),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (spots) => spots.map((s) {
                final min = s.y.toInt();
                final label =
                    min >= 60 ? '${min ~/ 60}j ${min % 60}m' : '${min}m';
                return LineTooltipItem(
                  label,
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
