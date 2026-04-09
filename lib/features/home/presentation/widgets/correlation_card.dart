import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/dashboard_provider.dart';

class CorrelationCard extends ConsumerWidget {
  const CorrelationCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final corrAsync = ref.watch(correlationProvider);
    final theme = Theme.of(context);

    return corrAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (data) {
        if (data == null || !data.hasEnoughData) return const SizedBox.shrink();

        final percent = data.screenTimeReductionPercent.abs().toStringAsFixed(0);

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF4CAF50).withAlpha(20),
            border: Border.all(
              color: const Color(0xFF4CAF50).withAlpha(80),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const Text('📊', style: TextStyle(fontSize: 28)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Di hari kamu selesaikan semua habit, screen time-mu $percent% lebih rendah!',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
