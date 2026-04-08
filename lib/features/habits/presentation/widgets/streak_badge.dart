import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class StreakBadge extends StatelessWidget {
  final int streak;

  const StreakBadge({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    if (streak == 0) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🔥', style: TextStyle(fontSize: 12)),
        const SizedBox(width: 2),
        Text(
          '$streak hari',
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.accent,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
