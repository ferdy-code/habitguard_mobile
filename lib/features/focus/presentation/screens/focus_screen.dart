import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/focus_session.dart';
import '../providers/focus_provider.dart';
import '../widgets/focus_timer_circle.dart';

class FocusScreen extends ConsumerStatefulWidget {
  const FocusScreen({super.key});

  @override
  ConsumerState<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends ConsumerState<FocusScreen> {
  int _customFocusMinutes = 25;
  int _customBreakMinutes = 5;
  final List<String> _selectedApps = [];

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
      body: switch (timerState.phase) {
        TimerPhase.idle => _SetupView(
            focusMinutes: _customFocusMinutes,
            breakMinutes: _customBreakMinutes,
            selectedApps: _selectedApps,
            onFocusChanged: (v) => setState(() => _customFocusMinutes = v),
            onBreakChanged: (v) => setState(() => _customBreakMinutes = v),
            onAppToggled: (pkg) => setState(() {
              if (_selectedApps.contains(pkg)) {
                _selectedApps.remove(pkg);
              } else {
                _selectedApps.add(pkg);
              }
            }),
            onStart: _startSession,
            commonApps: _commonApps,
          ),
        TimerPhase.completed => _CompletedView(state: timerState),
        _ => _TimerView(state: timerState),
      },
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
}

// ── Setup view ───────────────────────────────────────────────────

class _SetupView extends StatelessWidget {
  final int focusMinutes;
  final int breakMinutes;
  final List<String> selectedApps;
  final ValueChanged<int> onFocusChanged;
  final ValueChanged<int> onBreakChanged;
  final ValueChanged<String> onAppToggled;
  final VoidCallback onStart;
  final List<(String, String)> commonApps;

  const _SetupView({
    required this.focusMinutes,
    required this.breakMinutes,
    required this.selectedApps,
    required this.onFocusChanged,
    required this.onBreakChanged,
    required this.onAppToggled,
    required this.onStart,
    required this.commonApps,
  });

  bool get _isPomodoro => focusMinutes == 25 && breakMinutes == 5;
  bool get _isDeepFocus => focusMinutes == 50 && breakMinutes == 10;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          onPressed: onStart,
          icon: const Icon(Icons.play_arrow),
          label: const Text('Mulai Fokus'),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildTypeCards(ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: _TypeCard(
            label: 'Pomodoro',
            subtitle: '25/5 menit',
            icon: Icons.timer,
            color: AppColors.primary,
            selected: _isPomodoro,
            onTap: () {
              onFocusChanged(25);
              onBreakChanged(5);
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _TypeCard(
            label: 'Deep Focus',
            subtitle: '50/10 menit',
            icon: Icons.psychology,
            color: AppColors.secondary,
            selected: _isDeepFocus,
            onTap: () {
              onFocusChanged(50);
              onBreakChanged(10);
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _TypeCard(
            label: 'Custom',
            subtitle: 'Atur sendiri',
            icon: Icons.tune,
            color: AppColors.accent,
            selected: !_isPomodoro && !_isDeepFocus,
            onTap: () {
              onFocusChanged(30);
              onBreakChanged(5);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDurationSliders(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Fokus'),
                Text('$focusMinutes menit',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            Slider(
              value: focusMinutes.toDouble(),
              min: 5,
              max: 120,
              divisions: 23,
              onChanged: (v) => onFocusChanged(v.round()),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Istirahat'),
                Text('$breakMinutes menit',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            Slider(
              value: breakMinutes.toDouble(),
              min: 0,
              max: 30,
              divisions: 6,
              activeColor: AppColors.secondary,
              onChanged: (v) => onBreakChanged(v.round()),
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
      children: commonApps.map((app) {
        final (name, pkg) = app;
        return FilterChip(
          label: Text(name),
          selected: selectedApps.contains(pkg),
          onSelected: (_) => onAppToggled(pkg),
        );
      }).toList(),
    );
  }
}

// ── Timer view ───────────────────────────────────────────────────

class _TimerView extends ConsumerWidget {
  final FocusTimerState state;
  const _TimerView({required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isBreak = state.phase == TimerPhase.onBreak;
    final isPaused = state.phase == TimerPhase.paused;

    final minutes = state.remainingSeconds ~/ 60;
    final seconds = state.remainingSeconds % 60;
    final timeText =
        '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    final ringColor = isBreak ? AppColors.secondary : AppColors.primary;
    final subtitle = isBreak
        ? 'Istirahat'
        : isPaused
            ? 'Dijeda'
            : 'Fokus';

    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Phase banner
            if (isBreak)
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.secondary.withAlpha(20),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                      color: AppColors.secondary.withAlpha(80)),
                ),
                child: Text(
                  'Istirahat ${state.breakMinutes} menit 🎉',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            if (isPaused)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'Dijeda',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withAlpha(128),
                  ),
                ),
              ),

            // Timer circle
            FocusTimerCircle(
              progress: state.progress,
              timeText: timeText,
              subtitle: subtitle,
              color: ringColor,
            ),

            const SizedBox(height: 48),

            // Controls
            _TimerControls(
              state: state,
              onStop: () => _confirmStop(context, ref),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmStop(BuildContext context, WidgetRef ref) {
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
                backgroundColor: AppColors.danger),
            child: const Text('Hentikan'),
          ),
        ],
      ),
    );
  }
}

// ── Timer controls ───────────────────────────────────────────────

class _TimerControls extends ConsumerWidget {
  final FocusTimerState state;
  final VoidCallback onStop;

  const _TimerControls({required this.state, required this.onStop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(focusTimerProvider.notifier);
    final isOnBreak = state.phase == TimerPhase.onBreak;
    final isRunning = state.phase == TimerPhase.running;
    final isPaused = state.phase == TimerPhase.paused;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Pause / Resume (48×48)
        SizedBox(
          width: 48,
          height: 48,
          child: isRunning
              ? IconButton.filled(
                  onPressed: notifier.pause,
                  icon: const Icon(Icons.pause),
                  iconSize: 24,
                )
              : isPaused
                  ? IconButton.filled(
                      onPressed: notifier.resume,
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 24,
                    )
                  : const SizedBox.shrink(),
        ),

        const SizedBox(width: 20),

        // +5 min or placeholder (keeps stop button at fixed position)
        SizedBox(
          width: 90,
          height: 44,
          child: isOnBreak
              ? null
              : OutlinedButton(
                  onPressed: notifier.addFiveMinutes,
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    side: const BorderSide(color: AppColors.primary),
                    foregroundColor: AppColors.primary,
                  ),
                  child: const Text('+5 min'),
                ),
        ),

        const SizedBox(width: 20),

        // Stop (48×48)
        SizedBox(
          width: 48,
          height: 48,
          child: IconButton.filledTonal(
            onPressed: onStop,
            icon: const Icon(Icons.stop),
            iconSize: 24,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.danger.withAlpha(30),
              foregroundColor: AppColors.danger,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Completed view ───────────────────────────────────────────────

class _CompletedView extends ConsumerWidget {
  final FocusTimerState state;
  const _CompletedView({required this.state});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final focusMins = state.elapsedFocusSeconds ~/ 60;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle,
              color: AppColors.primary, size: 80),
          const SizedBox(height: 16),
          Text('Sesi Selesai!', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'Fokus: $focusMins menit',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withAlpha(153),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: 200,
            child: FilledButton.icon(
              onPressed: () =>
                  ref.read(focusTimerProvider.notifier).reset(),
              icon: const Icon(Icons.refresh),
              label: const Text('Sesi Baru'),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Type card ────────────────────────────────────────────────────

class _TypeCard extends StatelessWidget {
  final String label;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  const _TypeCard({
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: selected ? color.withAlpha(25) : null,
          border: Border.all(
            color: selected ? color : theme.dividerColor,
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: selected ? color : null,
                fontWeight:
                    selected ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withAlpha(128),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
