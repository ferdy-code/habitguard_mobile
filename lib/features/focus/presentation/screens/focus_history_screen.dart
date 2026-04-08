import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/focus_session.dart';
import '../providers/focus_provider.dart';

class FocusHistoryScreen extends ConsumerWidget {
  const FocusHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(focusHistoryProvider);
    final weekTotalAsync = ref.watch(focusWeekTotalProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Fokus')),
      body: Column(
        children: [
          // Week total header
          weekTotalAsync.when(
            data: (minutes) => _WeekTotalCard(minutes: minutes),
            loading: () => const _WeekTotalCard(minutes: 0),
            error: (_, __) => const SizedBox.shrink(),
          ),
          // Session list
          Expanded(
            child: historyAsync.when(
              data: (sessions) {
                if (sessions.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.timer_off,
                            size: 64,
                            color: theme.colorScheme.onSurface.withAlpha(77)),
                        const SizedBox(height: 12),
                        Text('Belum ada sesi fokus',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color:
                                  theme.colorScheme.onSurface.withAlpha(128),
                            )),
                      ],
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: sessions.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => _SessionTile(session: sessions[i]),
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Week total card ────────────────────────────────────────────

class _WeekTotalCard extends StatelessWidget {
  final int minutes;
  const _WeekTotalCard({required this.minutes});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    final display =
        hours > 0 ? '${hours}j ${mins}m' : '${mins}m';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4CAF50), Color(0xFF2196F3)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            'Total Fokus Minggu Ini',
            style: theme.textTheme.titleSmall?.copyWith(
              color: Colors.white.withAlpha(204),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            display,
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Session tile ───────────────────────────────────────────────

class _SessionTile extends StatelessWidget {
  final FocusSession session;
  const _SessionTile({required this.session});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = session.status == FocusSessionStatus.completed;
    final focusMins = session.actualFocusSeconds ~/ 60;
    final dateStr = DateFormat('dd MMM yyyy, HH:mm').format(session.startedAt);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              (isCompleted ? const Color(0xFF4CAF50) : const Color(0xFF9E9E9E))
                  .withAlpha(30),
          child: Icon(
            isCompleted ? Icons.check : Icons.cancel_outlined,
            color:
                isCompleted ? const Color(0xFF4CAF50) : const Color(0xFF9E9E9E),
          ),
        ),
        title: Text(
          '${_typeLabel(session.type)} — $focusMins menit',
          style: theme.textTheme.bodyLarge,
        ),
        subtitle: Text(dateStr),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color:
                (isCompleted ? const Color(0xFF4CAF50) : const Color(0xFF9E9E9E))
                    .withAlpha(30),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            isCompleted ? 'Selesai' : 'Dibatalkan',
            style: theme.textTheme.labelSmall?.copyWith(
              color: isCompleted
                  ? const Color(0xFF4CAF50)
                  : const Color(0xFF9E9E9E),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  String _typeLabel(FocusType type) {
    return switch (type) {
      FocusType.pomodoro => 'Pomodoro',
      FocusType.deepFocus => 'Deep Focus',
      FocusType.custom => 'Custom',
    };
  }
}
