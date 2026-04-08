import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/focus_session.dart';
import '../providers/focus_provider.dart';
import '../widgets/focus_timer_circle.dart';

class FocusScreen extends ConsumerStatefulWidget {
  const FocusScreen({super.key});

  @override
  ConsumerState<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends ConsumerState<FocusScreen> {
  int _customFocusMinutes = 30;
  int _customBreakMinutes = 5;
  final List<String> _selectedApps = [];

  // Common apps to block
  static const _commonApps = [
    ('Instagram', 'com.instagram.android'),
    ('TikTok', 'com.zhiliaoapp.musically'),
    ('Twitter/X', 'com.twitter.android'),
    ('YouTube', 'com.google.android.youtube'),
    ('Facebook', 'com.facebook.katana'),
    ('WhatsApp', 'com.whatsapp'),
    ('Telegram', 'org.telegram.messenger'),
    ('Reddit', 'com.reddit.frontpage'),
    ('Discord', 'com.discord'),
    ('Netflix', 'com.netflix.mediaclient'),
  ];

  @override
  Widget build(BuildContext context) {
    final timerState = ref.watch(focusTimerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Session'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => context.push('/focus/history'),
          ),
        ],
      ),
      body: timerState.phase == TimerPhase.idle
          ? _buildSetupView(theme)
          : _buildTimerView(timerState, theme),
    );
  }

  // ── Setup view ───────────────────────────────────────────────

  Widget _buildSetupView(ThemeData theme) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Pilih Tipe', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        _buildTypeCards(theme),
        const SizedBox(height: 24),
        Text('Custom Durasi', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        _buildDurationSliders(theme),
        const SizedBox(height: 24),
        Text('Blokir Aplikasi', style: theme.textTheme.titleMedium),
        const SizedBox(height: 12),
        _buildAppSelector(),
        const SizedBox(height: 32),
        FilledButton.icon(
          onPressed: _startSession,
          icon: const Icon(Icons.play_arrow),
          label: const Text('Mulai Fokus'),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
          ),
        ),
      ],
    );
  }

  Widget _buildTypeCards(ThemeData theme) {
    return Row(
      children: [
        _TypeCard(
          label: 'Pomodoro',
          subtitle: '25/5 menit',
          icon: Icons.timer,
          color: const Color(0xFF4CAF50),
          onTap: () => setState(() {
            _customFocusMinutes = 25;
            _customBreakMinutes = 5;
          }),
          selected: _customFocusMinutes == 25 && _customBreakMinutes == 5,
        ),
        const SizedBox(width: 8),
        _TypeCard(
          label: 'Deep Focus',
          subtitle: '50/10 menit',
          icon: Icons.psychology,
          color: const Color(0xFF2196F3),
          onTap: () => setState(() {
            _customFocusMinutes = 50;
            _customBreakMinutes = 10;
          }),
          selected: _customFocusMinutes == 50 && _customBreakMinutes == 10,
        ),
        const SizedBox(width: 8),
        _TypeCard(
          label: 'Custom',
          subtitle: 'Atur sendiri',
          icon: Icons.tune,
          color: const Color(0xFFFF9800),
          onTap: () => setState(() {
            _customFocusMinutes = 30;
            _customBreakMinutes = 5;
          }),
          selected: _customFocusMinutes != 25 &&
              _customFocusMinutes != 50 &&
              !(_customBreakMinutes == 5 && _customFocusMinutes == 25) &&
              !(_customBreakMinutes == 10 && _customFocusMinutes == 50),
        ),
      ],
    );
  }

  Widget _buildDurationSliders(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Fokus'),
                Text('$_customFocusMinutes menit',
                    style: theme.textTheme.titleSmall),
              ],
            ),
            Slider(
              value: _customFocusMinutes.toDouble(),
              min: 5,
              max: 120,
              divisions: 23,
              onChanged: (v) =>
                  setState(() => _customFocusMinutes = v.round()),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Istirahat'),
                Text('$_customBreakMinutes menit',
                    style: theme.textTheme.titleSmall),
              ],
            ),
            Slider(
              value: _customBreakMinutes.toDouble(),
              min: 0,
              max: 30,
              divisions: 6,
              onChanged: (v) =>
                  setState(() => _customBreakMinutes = v.round()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _commonApps.map((app) {
        final (name, pkg) = app;
        final selected = _selectedApps.contains(pkg);
        return FilterChip(
          label: Text(name),
          selected: selected,
          onSelected: (_) {
            setState(() {
              if (selected) {
                _selectedApps.remove(pkg);
              } else {
                _selectedApps.add(pkg);
              }
            });
          },
        );
      }).toList(),
    );
  }

  FocusType get _selectedType {
    if (_customFocusMinutes == 25 && _customBreakMinutes == 5) {
      return FocusType.pomodoro;
    }
    if (_customFocusMinutes == 50 && _customBreakMinutes == 10) {
      return FocusType.deepFocus;
    }
    return FocusType.custom;
  }

  void _startSession() {
    ref.read(focusTimerProvider.notifier).start(
          type: _selectedType,
          focusMinutes: _customFocusMinutes,
          breakMinutes: _customBreakMinutes,
          blockedApps: List.of(_selectedApps),
        );
  }

  // ── Timer view ───────────────────────────────────────────────

  Widget _buildTimerView(FocusTimerState s, ThemeData theme) {
    final isBreak = s.phase == TimerPhase.onBreak;
    final isCompleted = s.phase == TimerPhase.completed;
    final minutes = s.remainingSeconds ~/ 60;
    final seconds = s.remainingSeconds % 60;
    final timeText = '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';

    final color = isBreak
        ? const Color(0xFF2196F3)
        : isCompleted
            ? const Color(0xFF4CAF50)
            : const Color(0xFF4CAF50);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isBreak)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                'Istirahat! ${s.breakMinutes} menit',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: const Color(0xFF2196F3),
                ),
              ),
            ),
          if (isCompleted)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  const Icon(Icons.check_circle,
                      color: Color(0xFF4CAF50), size: 64),
                  const SizedBox(height: 8),
                  Text('Sesi Selesai!',
                      style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 4),
                  Text(
                    'Fokus: ${s.elapsedFocusSeconds ~/ 60} menit',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withAlpha(153),
                    ),
                  ),
                ],
              ),
            ),
          if (!isCompleted)
            FocusTimerCircle(
              progress: s.progress,
              timeText: timeText,
              subtitle: isBreak
                  ? 'Istirahat'
                  : s.phase == TimerPhase.paused
                      ? 'Dijeda'
                      : 'Fokus',
              color: color,
            ),
          const SizedBox(height: 32),
          if (!isCompleted) _buildTimerControls(s),
          if (isCompleted)
            FilledButton.icon(
              onPressed: () =>
                  ref.read(focusTimerProvider.notifier).reset(),
              icon: const Icon(Icons.refresh),
              label: const Text('Sesi Baru'),
            ),
        ],
      ),
    );
  }

  Widget _buildTimerControls(FocusTimerState s) {
    final notifier = ref.read(focusTimerProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Pause / Resume
        if (s.phase == TimerPhase.running)
          IconButton.filled(
            onPressed: notifier.pause,
            icon: const Icon(Icons.pause),
            iconSize: 32,
          ),
        if (s.phase == TimerPhase.paused)
          IconButton.filled(
            onPressed: notifier.resume,
            icon: const Icon(Icons.play_arrow),
            iconSize: 32,
          ),
        const SizedBox(width: 16),
        // +5 min
        if (s.phase != TimerPhase.onBreak)
          OutlinedButton(
            onPressed: notifier.addFiveMinutes,
            child: const Text('+5 min'),
          ),
        const SizedBox(width: 16),
        // Stop
        IconButton.filledTonal(
          onPressed: () => _confirmStop(context),
          icon: const Icon(Icons.stop),
          iconSize: 32,
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFFF44336).withAlpha(30),
            foregroundColor: const Color(0xFFF44336),
          ),
        ),
      ],
    );
  }

  void _confirmStop(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hentikan Sesi?'),
        content: const Text(
            'Sesi akan dicatat sebagai dibatalkan. Yakin ingin berhenti?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(focusTimerProvider.notifier).stop();
            },
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFF44336),
            ),
            child: const Text('Hentikan'),
          ),
        ],
      ),
    );
  }
}

// ── Type selection card ──────────────────────────────────────

class _TypeCard extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool selected;

  const _TypeCard({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            color: selected ? color.withAlpha(30) : null,
            border: Border.all(
              color: selected ? color : Theme.of(context).dividerColor,
              width: selected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: selected ? color : null,
                      fontWeight: selected ? FontWeight.bold : null,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(128),
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
