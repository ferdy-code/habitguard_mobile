import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/focus_session_dao.dart';
import '../../domain/entities/focus_session.dart';
import '../remote/focus_remote_source.dart';

extension _LocalFocusExt on LocalFocusSessionData {
  FocusSession toEntity() => FocusSession(
        id: id,
        userId: userId,
        type: FocusType.values.firstWhere(
          (e) => e.name == type,
          orElse: () => FocusType.custom,
        ),
        focusMinutes: focusMinutes,
        breakMinutes: breakMinutes,
        actualFocusSeconds: actualFocusSeconds,
        status: FocusSessionStatus.values.firstWhere(
          (e) => e.name == status,
          orElse: () => FocusSessionStatus.completed,
        ),
        blockedApps: blockedApps != null
            ? (jsonDecode(blockedApps!) as List).cast<String>()
            : [],
        startedAt: startedAt,
        endedAt: endedAt,
        createdAt: createdAt,
      );
}

class FocusRepositoryImpl {
  final FocusSessionDao _dao;
  final FocusRemoteSource _remote;

  FocusRepositoryImpl(this._dao, this._remote);

  Future<bool> _isOnline() async {
    final result = await Connectivity().checkConnectivity();
    return result.any((r) =>
        r == ConnectivityResult.wifi || r == ConnectivityResult.mobile);
  }

  Future<List<FocusSession>> getSessions() async {
    if (await _isOnline()) {
      try {
        final models = await _remote.getSessions();
        await _dao.upsertAll(
          models.map((m) => m.toLocalCompanion()).toList(),
        );
        return models.map((m) => m.toEntity()).toList();
      } catch (e) {
        log('getSessions remote error: $e');
      }
    }
    final local = await _dao.getAllSessions();
    return local.map((s) => s.toEntity()).toList();
  }

  Future<FocusSession> startSession({
    required String userId,
    required FocusType type,
    required int focusMinutes,
    required int breakMinutes,
    required List<String> blockedApps,
  }) async {
    final now = DateTime.now();
    final tempId = 'focus_${now.microsecondsSinceEpoch}';
    final body = {
      'type': type.name,
      'focusMinutes': focusMinutes,
      'breakMinutes': breakMinutes,
      'blockedApps': blockedApps,
      'startedAt': now.toIso8601String(),
    };

    String sessionId = tempId;

    if (await _isOnline()) {
      try {
        final model = await _remote.createSession(body);
        await _dao.upsertSession(model.toLocalCompanion());
        return model.toEntity();
      } catch (e) {
        log('startSession remote error: $e');
      }
    }

    // Offline fallback
    final companion = LocalFocusSessionsCompanion(
      id: Value(sessionId),
      userId: Value(userId),
      type: Value(type.name),
      focusMinutes: Value(focusMinutes),
      breakMinutes: Value(breakMinutes),
      actualFocusSeconds: const Value(0),
      status: const Value('completed'),
      blockedApps: Value(jsonEncode(blockedApps)),
      startedAt: Value(now),
      isSynced: const Value(false),
      createdAt: Value(now),
    );
    await _dao.upsertSession(companion);

    return FocusSession(
      id: sessionId,
      userId: userId,
      type: type,
      focusMinutes: focusMinutes,
      breakMinutes: breakMinutes,
      actualFocusSeconds: 0,
      status: FocusSessionStatus.completed,
      blockedApps: blockedApps,
      startedAt: now,
      createdAt: now,
    );
  }

  Future<void> endSession({
    required String sessionId,
    required int actualFocusSeconds,
    required FocusSessionStatus status,
  }) async {
    final now = DateTime.now();

    // Update local
    final existing = await _dao.getAllSessions();
    final local = existing.where((s) => s.id == sessionId).firstOrNull;
    if (local != null) {
      await _dao.upsertSession(
        local.toCompanion(true).copyWith(
              actualFocusSeconds: Value(actualFocusSeconds),
              status: Value(status.name),
              endedAt: Value(now),
              isSynced: const Value(false),
            ),
      );
    }

    // Sync to remote
    if (await _isOnline()) {
      try {
        await _remote.endSession(sessionId, {
          'actualFocusSeconds': actualFocusSeconds,
          'status': status.name,
          'endedAt': now.toIso8601String(),
        });
        if (local != null) {
          await _dao.markSynced(sessionId);
        }
      } catch (e) {
        log('endSession remote error: $e');
      }
    }
  }

  Future<List<FocusSession>> getSessionsForWeek() async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: now.weekday - 1));
    final end = start.add(const Duration(days: 7));
    final local = await _dao.getSessionsForRange(start, end);
    return local.map((s) => s.toEntity()).toList();
  }

  Future<int> getTotalFocusMinutesThisWeek() async {
    final sessions = await getSessionsForWeek();
    return sessions
        .where((s) => s.status == FocusSessionStatus.completed)
        .fold<int>(0, (sum, s) => sum + (s.actualFocusSeconds ~/ 60));
  }
}
