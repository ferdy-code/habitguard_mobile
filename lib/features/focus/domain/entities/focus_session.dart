import 'package:freezed_annotation/freezed_annotation.dart';

part 'focus_session.freezed.dart';

enum FocusSessionStatus { completed, cancelled }

enum FocusType { pomodoro, deepFocus, custom }

@freezed
abstract class FocusSession with _$FocusSession {
  const factory FocusSession({
    required String id,
    required String userId,
    required FocusType type,
    required int focusMinutes,
    required int breakMinutes,
    required int actualFocusSeconds,
    required FocusSessionStatus status,
    @Default([]) List<String> blockedApps,
    required DateTime startedAt,
    DateTime? endedAt,
    required DateTime createdAt,
  }) = _FocusSession;
}
