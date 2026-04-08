import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/app_colors.dart';
import '../providers/habit_provider.dart';
import 'streak_badge.dart';

class HabitCard extends StatelessWidget {
  final int index;
  final HabitWithStatus habitWithStatus;
  final VoidCallback onTap;
  final void Function(String? note) onToggle;

  const HabitCard({
    super.key,
    required this.index,
    required this.habitWithStatus,
    required this.onTap,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final habit = habitWithStatus.habit;
    final isCompleted = habitWithStatus.isCompleted;
    final color = colorFromHex(habit.color);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        onLongPress: () => _showNoteDialog(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              ReorderableDragStartListener(
                index: index,
                child: const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.drag_handle, color: AppColors.grey400, size: 20),
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(habit.emoji, style: const TextStyle(fontSize: 22)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            decoration:
                                isCompleted ? TextDecoration.lineThrough : null,
                            color: isCompleted ? AppColors.grey400 : null,
                          ),
                    ),
                    if (habit.currentStreak > 0) ...[
                      const SizedBox(height: 2),
                      StreakBadge(streak: habit.currentStreak),
                    ],
                  ],
                ),
              ),
              _AnimatedCheckbox(
                isCompleted: isCompleted,
                color: color,
                onTap: () => onToggle(null),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNoteDialog(BuildContext context) {
    final isCompleted = habitWithStatus.isCompleted;
    final ctrl = TextEditingController(text: habitWithStatus.note ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isCompleted ? 'Catatan' : 'Tambah Catatan'),
        content: isCompleted
            ? Text(
                habitWithStatus.note?.isNotEmpty == true
                    ? habitWithStatus.note!
                    : 'Tidak ada catatan',
                style: Theme.of(ctx).textTheme.bodyMedium,
              )
            : TextField(
                controller: ctrl,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Catatan opsional...',
                ),
                autofocus: true,
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Tutup'),
          ),
          if (!isCompleted)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                onToggle(ctrl.text.trim().isEmpty ? null : ctrl.text.trim());
              },
              child: const Text('Tandai Selesai'),
            ),
        ],
      ),
    );
  }
}

class _AnimatedCheckbox extends StatefulWidget {
  final bool isCompleted;
  final Color color;
  final VoidCallback onTap;

  const _AnimatedCheckbox({
    required this.isCompleted,
    required this.color,
    required this.onTap,
  });

  @override
  State<_AnimatedCheckbox> createState() => _AnimatedCheckboxState();
}

class _AnimatedCheckboxState extends State<_AnimatedCheckbox>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scale = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.75), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.75, end: 1.2), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _handleTap() {
    HapticFeedback.mediumImpact();
    _ctrl.forward(from: 0);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedBuilder(
        animation: _scale,
        builder: (_, __) => Transform.scale(
          scale: _scale.value,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.isCompleted ? widget.color : Colors.transparent,
              border: widget.isCompleted
                  ? null
                  : Border.all(color: widget.color, width: 2.5),
            ),
            child: widget.isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
        ),
      ),
    );
  }
}
