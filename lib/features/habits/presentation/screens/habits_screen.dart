import 'dart:math';
import 'dart:developer' as logger;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/empty_state_widget.dart';
import '../../../../shared/widgets/error_retry_widget.dart';
import '../providers/habit_provider.dart';
import '../widgets/habit_card.dart';

class HabitsScreen extends ConsumerWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push('/settings'),
          ),
        ],
      ),
      body: const Column(
        children: [
          _DateStrip(),
          _ProgressSection(),
          Divider(height: 1),
          Expanded(child: _HabitsList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/habits/create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// ─── Date Strip ──────────────────────────────────────────────────────────────

class _DateStrip extends ConsumerWidget {
  const _DateStrip();

  static const _dayAbbr = ['Sen', 'Sel', 'Rab', 'Kam', 'Jum', 'Sab', 'Min'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedDateProvider);
    final today = DateUtils.dateOnly(DateTime.now());
    final dates = List.generate(
      7,
      (i) => today.subtract(Duration(days: 3 - i)),
    );

    return SizedBox(
      height: 76,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: dates.length,
        itemBuilder: (context, i) {
          final date = dates[i];
          final isSelected = DateUtils.isSameDay(date, selected);
          final isToday = DateUtils.isSameDay(date, today);

          return GestureDetector(
            onTap: () => ref.read(selectedDateProvider.notifier).setDate(date),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: 44,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _dayAbbr[date.weekday - 1],
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : AppColors.grey500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? Colors.white
                          : isToday
                          ? AppColors.primary
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Progress Section ─────────────────────────────────────────────────────────

class _ProgressSection extends ConsumerWidget {
  const _ProgressSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(habitsForSelectedDateProvider);

    return habitsAsync.when(
      loading: () => const SizedBox(height: 72),
      error: (_, __) => const SizedBox(height: 72),
      data: (habits) {
        final total = habits.length;
        final done = habits.where((h) => h.isCompleted).length;
        final progress = total > 0 ? done / total : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              SizedBox(
                width: 56,
                height: 56,
                child: CustomPaint(
                  painter: _ProgressRingPainter(
                    progress: progress,
                    color: AppColors.primary,
                  ),
                  child: Center(
                    child: Text(
                      '$done/$total',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      total == 0
                          ? 'Belum ada habit hari ini'
                          : '$done dari $total habit selesai',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      total == 0
                          ? 'Tambah habit untuk mulai'
                          : '${(progress * 100).round()}% tercapai',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: AppColors.grey500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProgressRingPainter extends CustomPainter {
  final double progress;
  final Color color;

  const _ProgressRingPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    const stroke = 5.5;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (min(size.width, size.height) - stroke) / 2;

    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = color.withValues(alpha: 0.15)
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke,
    );

    if (progress > 0) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * pi * progress,
        false,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = stroke
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(_ProgressRingPainter old) => old.progress != progress;
}

// ─── Habits List ──────────────────────────────────────────────────────────────

class _HabitsList extends ConsumerWidget {
  const _HabitsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(habitsForSelectedDateProvider);
    final selectedDate = ref.watch(selectedDateProvider);

    return habitsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => ErrorRetryWidget(
        message: e.toString(),
        onRetry: () => ref.invalidate(habitsListProvider),
      ),
      data: (habits) {
        // logger.log(habits.toString());
        if (habits.isEmpty) {
          return const EmptyStateWidget(
            icon: Icons.check_circle_outline,
            title: 'Tidak ada habit',
            subtitle: 'Tap + untuk menambah habit baru',
          );
        }

        return RefreshIndicator(
          onRefresh: () => ref.read(habitsListProvider.notifier).refresh(),
          child: ReorderableListView.builder(
            buildDefaultDragHandles: false,
            padding: const EdgeInsets.only(bottom: 88),
            itemCount: habits.length,
            onReorder: (oldIndex, newIndex) {
              if (newIndex > oldIndex) newIndex--;
              ref
                  .read(habitsListProvider.notifier)
                  .reorder(habits[oldIndex].habit.id, newIndex);
            },
            itemBuilder: (context, index) {
              final item = habits[index];
              return HabitCard(
                key: ValueKey(item.habit.id),
                index: index,
                habitWithStatus: item,
                onTap: () => context.push('/habits/${item.habit.id}'),
                onToggle: (note) => ref
                    .read(habitsListProvider.notifier)
                    .toggleCompletion(item.habit.id, selectedDate, note: note),
              );
            },
          ),
        );
      },
    );
  }
}
