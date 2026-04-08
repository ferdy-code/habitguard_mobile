import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/network/api_client.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../data/remote/focus_remote_source.dart';
import '../../data/repositories/focus_repository_impl.dart';
import '../../domain/entities/focus_session.dart';

// ── Infrastructure ──────────────────────────────────────────────

final _focusRemoteProvider = Provider<FocusRemoteSource>(
  (ref) => FocusRemoteSource(ref.watch(apiClientProvider)),
);

final focusRepositoryProvider = Provider<FocusRepositoryImpl>(
  (ref) => FocusRepositoryImpl(
    ref.watch(focusSessionDaoProvider),
    ref.watch(_focusRemoteProvider),
  ),
);

// ── Timer state ─────────────────────────────────────────────────

enum TimerPhase { idle, running, paused, onBreak, completed }

@immutable
class FocusTimerState {
  final TimerPhase phase;
  final int remainingSeconds;
  final int elapsedFocusSeconds;
  final int focusMinutes;
  final int breakMinutes;
  final FocusType type;
  final List<String> blockedApps;
  final String? sessionId;

  const FocusTimerState({
    this.phase = TimerPhase.idle,
    this.remainingSeconds = 0,
    this.elapsedFocusSeconds = 0,
    this.focusMinutes = 25,
    this.breakMinutes = 5,
    this.type = FocusType.pomodoro,
    this.blockedApps = const [],
    this.sessionId,
  });

  FocusTimerState copyWith({
    TimerPhase? phase,
    int? remainingSeconds,
    int? elapsedFocusSeconds,
    int? focusMinutes,
    int? breakMinutes,
    FocusType? type,
    List<String>? blockedApps,
    String? sessionId,
  }) {
    return FocusTimerState(
      phase: phase ?? this.phase,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      elapsedFocusSeconds: elapsedFocusSeconds ?? this.elapsedFocusSeconds,
      focusMinutes: focusMinutes ?? this.focusMinutes,
      breakMinutes: breakMinutes ?? this.breakMinutes,
      type: type ?? this.type,
      blockedApps: blockedApps ?? this.blockedApps,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  double get progress {
    final total = phase == TimerPhase.onBreak
        ? breakMinutes * 60
        : focusMinutes * 60;
    if (total == 0) return 0;
    return 1.0 - (remainingSeconds / total);
  }
}

class FocusTimerNotifier extends Notifier<FocusTimerState> {
  Timer? _timer;

  @override
  FocusTimerState build() => const FocusTimerState();

  Future<void> start({
    required FocusType type,
    required int focusMinutes,
    required int breakMinutes,
    required List<String> blockedApps,
  }) async {
    _timer?.cancel();

    final userId = ref.read(currentUserProvider)?.id ?? '';
    final repo = ref.read(focusRepositoryProvider);
    final session = await repo.startSession(
      userId: userId,
      type: type,
      focusMinutes: focusMinutes,
      breakMinutes: breakMinutes,
      blockedApps: blockedApps,
    );

    state = FocusTimerState(
      phase: TimerPhase.running,
      remainingSeconds: focusMinutes * 60,
      elapsedFocusSeconds: 0,
      focusMinutes: focusMinutes,
      breakMinutes: breakMinutes,
      type: type,
      blockedApps: blockedApps,
      sessionId: session.id,
    );

    _startTicking();
  }

  void pause() {
    if (state.phase != TimerPhase.running) return;
    _timer?.cancel();
    state = state.copyWith(phase: TimerPhase.paused);
  }

  void resume() {
    if (state.phase != TimerPhase.paused) return;
    state = state.copyWith(phase: TimerPhase.running);
    _startTicking();
  }

  void addFiveMinutes() {
    if (state.phase == TimerPhase.running || state.phase == TimerPhase.paused) {
      state = state.copyWith(remainingSeconds: state.remainingSeconds + 300);
    }
  }

  Future<void> stop() async {
    _timer?.cancel();
    if (state.sessionId != null) {
      await ref.read(focusRepositoryProvider).endSession(
            sessionId: state.sessionId!,
            actualFocusSeconds: state.elapsedFocusSeconds,
            status: FocusSessionStatus.cancelled,
          );
      ref.invalidate(focusHistoryProvider);
    }
    state = state.copyWith(phase: TimerPhase.completed);
  }

  void reset() {
    _timer?.cancel();
    state = const FocusTimerState();
  }

  void _startTicking() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _tick());
  }

  Future<void> _tick() async {
    final s = state;
    if (s.phase == TimerPhase.running) {
      if (s.remainingSeconds <= 1) {
        _timer?.cancel();
        // Focus done → start break
        if (s.breakMinutes > 0) {
          state = s.copyWith(
            phase: TimerPhase.onBreak,
            remainingSeconds: s.breakMinutes * 60,
            elapsedFocusSeconds: s.elapsedFocusSeconds + 1,
          );
          _startTicking();
        } else {
          await _complete();
        }
      } else {
        state = s.copyWith(
          remainingSeconds: s.remainingSeconds - 1,
          elapsedFocusSeconds: s.elapsedFocusSeconds + 1,
        );
      }
    } else if (s.phase == TimerPhase.onBreak) {
      if (s.remainingSeconds <= 1) {
        _timer?.cancel();
        await _complete();
      } else {
        state = s.copyWith(remainingSeconds: s.remainingSeconds - 1);
      }
    }
  }

  Future<void> _complete() async {
    if (state.sessionId != null) {
      await ref.read(focusRepositoryProvider).endSession(
            sessionId: state.sessionId!,
            actualFocusSeconds: state.elapsedFocusSeconds,
            status: FocusSessionStatus.completed,
          );
      ref.invalidate(focusHistoryProvider);
    }
    state = state.copyWith(phase: TimerPhase.completed);
  }
}

final focusTimerProvider =
    NotifierProvider<FocusTimerNotifier, FocusTimerState>(
  FocusTimerNotifier.new,
);

// ── History ─────────────────────────────────────────────────────

final focusHistoryProvider = FutureProvider<List<FocusSession>>((ref) {
  return ref.watch(focusRepositoryProvider).getSessions();
});

// ── Stats ───────────────────────────────────────────────────────

final focusWeekTotalProvider = FutureProvider<int>((ref) {
  return ref.watch(focusRepositoryProvider).getTotalFocusMinutesThisWeek();
});
