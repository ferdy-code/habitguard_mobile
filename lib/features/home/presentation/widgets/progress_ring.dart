import 'dart:math';
import 'package:flutter/material.dart';

/// Animated double-ring progress indicator.
/// [outerProgress] 0.0–1.0 — outer ring (habit completion, green gradient)
class ProgressRing extends StatefulWidget {
  final double outerProgress;
  final String centerTop; // e.g. "5/7"
  final String centerBottom; // e.g. "selesai"

  const ProgressRing({
    super.key,
    required this.outerProgress,
    required this.centerTop,
    required this.centerBottom,
  });

  @override
  State<ProgressRing> createState() => _ProgressRingState();
}

class _ProgressRingState extends State<ProgressRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _progressAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _progressAnim = Tween<double>(begin: 0, end: widget.outerProgress)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(ProgressRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.outerProgress != widget.outerProgress) {
      _progressAnim = Tween<double>(
        begin: _progressAnim.value,
        end: widget.outerProgress,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _progressAnim,
      builder: (_, __) => CustomPaint(
        size: const Size(160, 160),
        painter: _RingPainter(
          progress: _progressAnim.value,
          trackColor: theme.colorScheme.surfaceContainerHighest,
        ),
        child: SizedBox(
          width: 160,
          height: 160,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.centerTop,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4CAF50),
                  ),
                ),
                Text(
                  widget.centerBottom,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(153),
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

class _RingPainter extends CustomPainter {
  final double progress;
  final Color trackColor;

  _RingPainter({required this.progress, required this.trackColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 10;
    const strokeWidth = 12.0;

    // Track
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth,
    );

    // Gradient arc
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradientPaint = Paint()
      ..shader = const SweepGradient(
        startAngle: -pi / 2,
        endAngle: 3 * pi / 2,
        colors: [Color(0xFF81C784), Color(0xFF4CAF50), Color(0xFF2E7D32)],
        stops: [0.0, 0.5, 1.0],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      -pi / 2,
      2 * pi * progress.clamp(0.0, 1.0),
      false,
      gradientPaint,
    );
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}
