import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/completion.dart';

class CompletionCalendar extends StatelessWidget {
  final List<Completion> completions;
  final Color color;

  const CompletionCalendar({
    super.key,
    required this.completions,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const weeks = 12;
        const days = 7;
        const gap = 3.0;
        final cellSize = (constraints.maxWidth - gap * (weeks - 1)) / weeks;
        final totalHeight = cellSize * days + gap * (days - 1);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day labels row
            Row(
              children: [
                for (final label in ['S', 'S', 'R', 'K', 'J', 'S', 'M'])
                  SizedBox(
                    width: cellSize + gap,
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.grey500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: totalHeight,
              child: CustomPaint(
                painter: _HeatmapPainter(
                  completions: completions,
                  color: color,
                  cellSize: cellSize,
                  gap: gap,
                ),
                size: Size(constraints.maxWidth, totalHeight),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _HeatmapPainter extends CustomPainter {
  final List<Completion> completions;
  final Color color;
  final double cellSize;
  final double gap;

  const _HeatmapPainter({
    required this.completions,
    required this.color,
    required this.cellSize,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const weeks = 12;
    const days = 7;

    final completedDates = <DateTime>{};
    for (final c in completions) {
      completedDates.add(DateUtils.dateOnly(c.completedAt));
    }

    final today = DateUtils.dateOnly(DateTime.now());
    // Start from the Monday of the week that was (weeks * days) days ago
    final startDate = today.subtract(const Duration(days: weeks * days - 1));

    for (int w = 0; w < weeks; w++) {
      for (int d = 0; d < days; d++) {
        final date = startDate.add(Duration(days: w * days + d));
        final isCompleted = completedDates.contains(date);
        final isToday = DateUtils.isSameDay(date, today);
        final isFuture = date.isAfter(today);

        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(
            w * (cellSize + gap),
            d * (cellSize + gap),
            cellSize,
            cellSize,
          ),
          const Radius.circular(3),
        );

        canvas.drawRRect(
          rect,
          Paint()
            ..color = isFuture
                ? color.withValues(alpha: 0.04)
                : isCompleted
                    ? color.withValues(alpha: 0.85)
                    : color.withValues(alpha: 0.12)
            ..style = PaintingStyle.fill,
        );

        if (isToday) {
          canvas.drawRRect(
            rect,
            Paint()
              ..color = AppColors.accent
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.5,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_HeatmapPainter old) =>
      old.completions.length != completions.length ||
      old.color != color;
}
