import 'package:flutter/material.dart';
import '../../domain/entities/screen_time_entry.dart';

/// Category → color mapping
Color categoryColor(String category) {
  return switch (category) {
    'Sosial Media' => const Color(0xFFE91E63),
    'Pesan'        => const Color(0xFF2196F3),
    'Video'        => const Color(0xFFFF5722),
    'Musik'        => const Color(0xFF9C27B0),
    'Game'         => const Color(0xFFF44336),
    'Produktivitas'=> const Color(0xFF4CAF50),
    'Pendidikan'   => const Color(0xFF00BCD4),
    'Berita'       => const Color(0xFF607D8B),
    'Belanja'      => const Color(0xFFFF9800),
    'Keuangan'     => const Color(0xFF795548),
    'Browser'      => const Color(0xFF3F51B5),
    'Sistem'       => const Color(0xFF9E9E9E),
    _              => const Color(0xFFBDBDBD),
  };
}

class ScreenTimeBarChart extends StatelessWidget {
  final List<ScreenTimeEntry> entries;
  final void Function(ScreenTimeEntry)? onTap;

  const ScreenTimeBarChart({
    super.key,
    required this.entries,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Top 5 apps
    final top5 = entries.take(5).toList();
    if (top5.isEmpty) {
      return const SizedBox(
        height: 150,
        child: Center(child: Text('Belum ada data')),
      );
    }

    final maxVal = top5.first.usageMinutes.toDouble();

    return Column(
      children: [
        for (int i = 0; i < top5.length; i++) ...[
          _BarRow(
            entry: top5[i],
            maxVal: maxVal,
            onTap: onTap != null ? () => onTap!(top5[i]) : null,
          ),
          if (i < top5.length - 1) const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _BarRow extends StatelessWidget {
  final ScreenTimeEntry entry;
  final double maxVal;
  final VoidCallback? onTap;

  const _BarRow({
    required this.entry,
    required this.maxVal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = categoryColor(entry.category);
    final fraction = maxVal > 0 ? entry.usageMinutes / maxVal : 0.0;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              entry.appName,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: LayoutBuilder(
              builder: (ctx, constraints) => Stack(
                children: [
                  Container(
                    height: 22,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 22,
                    width: constraints.maxWidth * fraction,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 48,
            child: Text(
              _formatMinutes(entry.usageMinutes),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  String _formatMinutes(int min) {
    if (min >= 60) return '${min ~/ 60}j ${min % 60}m';
    return '${min}m';
  }
}
