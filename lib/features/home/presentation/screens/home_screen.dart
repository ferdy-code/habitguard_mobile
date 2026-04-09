import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../habits/presentation/providers/habit_provider.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/progress_ring.dart';
import '../widgets/ai_insight_card.dart';
import '../widgets/correlation_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final theme = Theme.of(context);
    final now = DateTime.now();
    final hour = now.hour;
    final greeting = hour < 12
        ? 'Selamat pagi'
        : hour < 17
            ? 'Selamat siang'
            : 'Selamat malam';
    final name = user?.displayName.split(' ').first ?? 'Kamu';
    final dateStr = DateFormat('EEEE, d MMMM yyyy', 'id').format(now);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App bar / header
          SliverAppBar(
            expandedHeight: 80,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$greeting, $name 👋',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dateStr,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withAlpha(153),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_outlined),
                onPressed: () => context.push('/settings'),
              ),
            ],
          ),

          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ── Progress + Screen Time row ─────────────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 184, child: _HabitProgressCard()),
                    const SizedBox(width: 12),
                    Expanded(child: _ScreenTimeCard()),
                  ],
                ),
                const SizedBox(height: 12),

                // ── Focus today ───────────────────────────────────
                _FocusTodayCard(),
                const SizedBox(height: 12),

                // ── AI Insight ────────────────────────────────────
                const AiInsightCard(),
                const SizedBox(height: 12),

                // ── Correlation ───────────────────────────────────
                const CorrelationCard(),
                const SizedBox(height: 12),

                // ── Quick Habits ──────────────────────────────────
                _QuickHabitsSection(),
                const SizedBox(height: 12),

                // ── Streak Summary ────────────────────────────────
                _StreakSummary(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Habit progress card ──────────────────────────────────────────

class _HabitProgressCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(habitSummaryProvider);
    final theme = Theme.of(context);
    final rate = summary.total == 0
        ? 0.0
        : summary.completed / summary.total;

    return GestureDetector(
      onTap: () => context.go('/habits'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ProgressRing(
                outerProgress: rate,
                centerTop: '${summary.completed}/${summary.total}',
                centerBottom: 'selesai',
              ),
              const SizedBox(height: 8),
              Text(
                'Habit Hari Ini',
                style: theme.textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Screen time card ─────────────────────────────────────────────

class _ScreenTimeCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stv = ref.watch(screenTimeVsLimitProvider);
    final theme = Theme.of(context);
    final ratio = stv.ratio;

    final barColor = ratio == 0
        ? const Color(0xFF2196F3)
        : ratio >= 1.0
            ? const Color(0xFFF44336)
            : ratio >= 0.8
                ? const Color(0xFFFF9800)
                : const Color(0xFF2196F3);

    String fmt(int minutes) {
      if (minutes == 0) return '0m';
      final h = minutes ~/ 60;
      final m = minutes % 60;
      return h > 0 ? '${h}j ${m}m' : '${m}m';
    }

    return GestureDetector(
      onTap: () => context.go('/screen-time'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.phone_android,
                      color: barColor, size: 18),
                  const SizedBox(width: 6),
                  Text('Screen Time',
                      style: theme.textTheme.labelMedium),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                fmt(stv.usageMinutes),
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: barColor,
                ),
              ),
              if (stv.limitMinutes > 0) ...[
                const SizedBox(height: 2),
                Text(
                  '/ ${fmt(stv.limitMinutes)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(128),
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: ratio.clamp(0.0, 1.0),
                    backgroundColor: barColor.withAlpha(30),
                    valueColor: AlwaysStoppedAnimation<Color>(barColor),
                    minHeight: 8,
                  ),
                ),
              ],
              if (stv.limitMinutes == 0) ...[
                const SizedBox(height: 6),
                Text(
                  'Belum ada limit',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(102),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// ── Focus today card ─────────────────────────────────────────────

class _FocusTodayCard extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final minutes = ref.watch(focusTodayMinutesProvider);
    final theme = Theme.of(context);

    String text;
    if (minutes == 0) {
      text = 'Belum ada sesi fokus hari ini';
    } else {
      final h = minutes ~/ 60;
      final m = minutes % 60;
      final dur = h > 0 ? '${h}j ${m}m' : '${m}m';
      text = '$dur fokus hari ini';
    }

    return GestureDetector(
      onTap: () => context.go('/focus'),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              const Text('🎯', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: theme.colorScheme.onSurface.withAlpha(102),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Quick habit actions ──────────────────────────────────────────

class _QuickHabitsSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habitsAsync = ref.watch(quickHabitsProvider);
    final theme = Theme.of(context);

    return habitsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (habits) {
        if (habits.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Belum Selesai',
                    style: theme.textTheme.titleMedium),
                TextButton(
                  onPressed: () => context.go('/habits'),
                  child: const Text('Lihat Semua'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...habits.map((h) => _QuickHabitTile(habitWithStatus: h)),
          ],
        );
      },
    );
  }
}

class _QuickHabitTile extends ConsumerWidget {
  final HabitWithStatus habitWithStatus;
  const _QuickHabitTile({required this.habitWithStatus});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = habitWithStatus.habit;
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(
            int.parse(h.color.replaceFirst('#', 'FF'), radix: 16),
          ).withAlpha(40),
          child: Text(h.emoji, style: const TextStyle(fontSize: 18)),
        ),
        title: Text(h.title, style: theme.textTheme.bodyLarge),
        subtitle: h.category != null ? Text(h.category!) : null,
        trailing: GestureDetector(
          onTap: () => ref.read(habitsListProvider.notifier).toggleCompletion(
                h.id,
                DateTime.now(),
              ),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(
                  int.parse(h.color.replaceFirst('#', 'FF'), radix: 16),
                ),
                width: 2,
              ),
            ),
            child: const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

// ── Streak summary ───────────────────────────────────────────────

class _StreakSummary extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habits = ref.watch(topStreakHabitsProvider);
    final theme = Theme.of(context);

    final withStreak = habits.where((h) => h.habit.currentStreak > 0).toList();
    if (withStreak.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Streak Terbaik', style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(
          children: withStreak
              .map(
                (h) => Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      child: Column(
                        children: [
                          Text(h.habit.emoji,
                              style: const TextStyle(fontSize: 24)),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('🔥',
                                  style: TextStyle(fontSize: 14)),
                              const SizedBox(width: 2),
                              Text(
                                '${h.habit.currentStreak}',
                                style:
                                    theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFF9800),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            h.habit.title,
                            style: theme.textTheme.bodySmall,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
