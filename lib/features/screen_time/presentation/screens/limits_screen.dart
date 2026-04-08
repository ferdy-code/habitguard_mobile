import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/screen_time_provider.dart';

class LimitsScreen extends ConsumerWidget {
  const LimitsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final limitsAsync = ref.watch(limitsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Batas Penggunaan')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context, ref),
        child: const Icon(Icons.add),
      ),
      body: limitsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (limits) {
          if (limits.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.timer_off_outlined,
                        size: 56, color: AppColors.grey400),
                    SizedBox(height: 12),
                    Text('Belum ada batas penggunaan'),
                    SizedBox(height: 4),
                    Text(
                      'Tekan + untuk menambah batas harian',
                      style: TextStyle(color: AppColors.grey500, fontSize: 13),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: limits.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final limit = limits[i];
              final label =
                  limit.packageName ?? limit.category ?? 'Semua Aplikasi';
              final hours = limit.dailyLimitMinutes ~/ 60;
              final mins = limit.dailyLimitMinutes % 60;
              final timeStr = hours > 0 ? '${hours}j ${mins}m' : '${mins}m';

              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.secondary.withValues(alpha: 0.1),
                    child: const Icon(Icons.timer,
                        color: AppColors.secondary, size: 20),
                  ),
                  title: Text(label),
                  subtitle: Text('Batas harian: $timeStr'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: AppColors.danger),
                    onPressed: () => _confirmDelete(context, ref, limit.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context, WidgetRef ref) async {
    String? category;
    int limitMinutes = 60;

    final categories = [
      'Sosial Media', 'Pesan', 'Video', 'Musik', 'Game',
      'Browser', 'Belanja', 'Lainnya',
    ];

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('Tambah Batas'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<String>(
                initialValue: category,
                decoration: const InputDecoration(
                  labelText: 'Kategori',
                  prefixIcon: Icon(Icons.category_outlined),
                ),
                items: categories
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (v) => setState(() => category = v),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('Batas harian:'),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => setState(
                        () => limitMinutes = (limitMinutes - 15).clamp(15, 720)),
                  ),
                  Text(
                    _fmtMin(limitMinutes),
                    style: Theme.of(ctx).textTheme.titleMedium,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: () => setState(
                        () => limitMinutes = (limitMinutes + 15).clamp(15, 720)),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Batal'),
            ),
            FilledButton(
              onPressed: category != null ? () => Navigator.pop(ctx, true) : null,
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );

    if (confirmed == true && category != null) {
      await ref.read(limitsProvider.notifier).addLimit(
            category: category,
            dailyLimitMinutes: limitMinutes,
          );
    }
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    String id,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Batas?'),
        content: const Text('Batas penggunaan ini akan dihapus.'),
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

    if (confirmed == true) {
      await ref.read(limitsProvider.notifier).removeLimit(id);
    }
  }

  static String _fmtMin(int min) {
    if (min >= 60) return '${min ~/ 60}j ${min % 60}m';
    return '${min}m';
  }
}
