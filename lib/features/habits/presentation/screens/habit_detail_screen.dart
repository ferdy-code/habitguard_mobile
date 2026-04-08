import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/completion.dart';
import '../../domain/entities/habit.dart';
import '../providers/habit_provider.dart';
import '../widgets/completion_calendar.dart';

class HabitDetailScreen extends ConsumerWidget {
  final String habitId;

  const HabitDetailScreen({super.key, required this.habitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(habitDetailProvider(habitId));

    return detailAsync.when(
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 48, color: AppColors.danger),
              const SizedBox(height: 12),
              Text(e.toString(), textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => ref.invalidate(habitDetailProvider(habitId)),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      ),
      data: (detail) => _HabitDetailView(detail: detail, habitId: habitId),
    );
  }
}

// ─── Main View ────────────────────────────────────────────────────────────────

class _HabitDetailView extends ConsumerWidget {
  final HabitDetail detail;
  final String habitId;

  const _HabitDetailView({required this.detail, required this.habitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final habit = detail.habit;
    final color = colorFromHex(habit.color);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context, ref, habit, color),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatsRow(detail: detail, color: color),
                  const SizedBox(height: 24),
                  const _SectionHeader(title: 'Kalender Penyelesaian'),
                  const SizedBox(height: 12),
                  CompletionCalendar(
                    completions: detail.heatmapCompletions,
                    color: color,
                  ),
                  const SizedBox(height: 24),
                  if (detail.recentCompletions.isNotEmpty) ...[
                    const _SectionHeader(title: 'Penyelesaian Terbaru'),
                    const SizedBox(height: 8),
                    _RecentCompletionsList(completions: detail.recentCompletions),
                    const SizedBox(height: 24),
                  ],
                  _ActionButtons(habit: habit, habitId: habitId),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(
    BuildContext context,
    WidgetRef ref,
    Habit habit,
    Color color,
  ) {
    return SliverAppBar(
      expandedHeight: 200,
      pinned: true,
      backgroundColor: color,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.share_outlined),
          tooltip: 'Bagikan',
          onPressed: () {
            // Share placeholder — implemented in Phase 6.3
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Fitur share segera hadir')),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          tooltip: 'Edit',
          onPressed: () => context.push('/habits/create', extra: habit),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color,
                color.withValues(alpha: 0.75),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 48),
                Text(habit.emoji, style: const TextStyle(fontSize: 56)),
                const SizedBox(height: 8),
                Text(
                  habit.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                if (habit.currentStreak > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🔥', style: TextStyle(fontSize: 14)),
                        const SizedBox(width: 4),
                        Text(
                          '${habit.currentStreak} hari streak',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Stats Row ────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  final HabitDetail detail;
  final Color color;

  const _StatsRow({required this.detail, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatCard(
          label: '7 Hari',
          value: '${(detail.rate7d * 100).round()}%',
          sub: '${detail.completionCount7d}/7',
          color: color,
        ),
        const SizedBox(width: 8),
        _StatCard(
          label: '30 Hari',
          value: '${(detail.rate30d * 100).round()}%',
          sub: '${detail.completionCount30d}/30',
          color: color,
        ),
        const SizedBox(width: 8),
        _StatCard(
          label: 'Total',
          value: '${detail.totalCompletions}',
          sub: 'kali',
          color: color,
        ),
        const SizedBox(width: 8),
        _StatCard(
          label: 'Terpanjang',
          value: '${detail.longestStreak}',
          sub: 'hari',
          color: color,
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String sub;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.sub,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.15)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              sub,
              style: const TextStyle(
                fontSize: 10,
                color: AppColors.grey500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.grey600,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Section Header ───────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

// ─── Recent Completions ───────────────────────────────────────────────────────

class _RecentCompletionsList extends StatelessWidget {
  final List<Completion> completions;

  const _RecentCompletionsList({required this.completions});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: completions.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, i) {
        final c = completions[i];
        final fmt = DateFormat('EEE, d MMM yyyy · HH:mm', 'id');
        return ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          leading: const Icon(
            Icons.check_circle,
            color: AppColors.primary,
            size: 20,
          ),
          title: Text(
            fmt.format(c.completedAt.toLocal()),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          subtitle: c.note != null && c.note!.isNotEmpty
              ? Text(
                  c.note!,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.grey500),
                )
              : null,
        );
      },
    );
  }
}

// ─── Action Buttons ───────────────────────────────────────────────────────────

class _ActionButtons extends ConsumerWidget {
  final Habit habit;
  final String habitId;

  const _ActionButtons({required this.habit, required this.habitId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Icon(
              habit.isArchived ? Icons.unarchive_outlined : Icons.archive_outlined,
            ),
            label: Text(habit.isArchived ? 'Batalkan Arsip' : 'Arsipkan Habit'),
            style: OutlinedButton.styleFrom(
              foregroundColor: habit.isArchived ? AppColors.primary : AppColors.grey600,
              side: BorderSide(
                color: habit.isArchived
                    ? AppColors.primary.withValues(alpha: 0.4)
                    : AppColors.grey300,
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () => _confirmArchive(context, ref),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Icon(Icons.delete_outline),
            label: const Text('Hapus Habit'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.danger,
              side: BorderSide(color: AppColors.danger.withValues(alpha: 0.4)),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            onPressed: () => _confirmDelete(context, ref),
          ),
        ),
      ],
    );
  }

  Future<void> _confirmArchive(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(habit.isArchived ? 'Batalkan Arsip?' : 'Arsipkan Habit?'),
        content: Text(
          habit.isArchived
              ? 'Habit akan muncul kembali di daftar.'
              : 'Habit akan disembunyikan dari daftar. Kamu bisa membatalkannya nanti.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(habit.isArchived ? 'Batalkan Arsip' : 'Arsipkan'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      await ref.read(habitsListProvider.notifier).archiveHabit(habitId);
      if (context.mounted) context.pop();
    }
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Habit?'),
        content: const Text(
          'Semua data termasuk riwayat penyelesaian akan dihapus permanen.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      // Delete via archive for now — full delete endpoint in Phase 2
      await ref.read(habitsListProvider.notifier).archiveHabit(habitId);
      if (context.mounted) context.pop();
    }
  }
}
