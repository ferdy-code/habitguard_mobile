import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/database/daos/screen_time_dao.dart';
import '../../domain/entities/screen_time_entry.dart';
import '../../services/screen_time_service.dart';
import '../remote/screen_time_remote_source.dart';

class ScreenTimeRepositoryImpl {
  final ScreenTimeDao _dao;
  final ScreenTimeRemoteSource _remote;
  final ScreenTimeService _service;

  ScreenTimeRepositoryImpl(this._dao, this._remote, this._service);

  Future<bool> _isOnline() async {
    final result = await Connectivity().checkConnectivity();
    return result.any((r) =>
        r == ConnectivityResult.wifi || r == ConnectivityResult.mobile);
  }

  // ── Sync: native → local → remote ──────────────────────────

  /// Fetches native usage stats, saves locally, then syncs to backend.
  Future<List<ScreenTimeEntry>> syncAndGetToday() async {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final todayEnd = todayStart.add(const Duration(days: 1));

    // 1. Get native data
    final nativeData = await _service.getUsageStats(todayStart, todayEnd);

    // 2. Save to local DB (replace today's data)
    await _dao.deleteLogsForDate(todayStart);
    if (nativeData.isNotEmpty) {
      await _dao.insertLogs(nativeData.map((a) => LocalScreenTimeCompanion(
            packageName: Value(a.packageName),
            appName: Value(a.appName),
            usageMinutes: Value(a.usageMinutes),
            category: Value(a.category),
            date: Value(todayStart),
            isSynced: const Value(false),
            createdAt: Value(now),
          )).toList());
    }

    // 3. Sync to backend
    if (await _isOnline()) {
      try {
        final unsynced = await _dao.getUnsyncedLogs();
        if (unsynced.isNotEmpty) {
          await _remote.syncLogs(unsynced.map((l) => {
                'packageName': l.packageName,
                'appName': l.appName,
                'usageMinutes': l.usageMinutes,
                'category': l.category,
                'date': l.date.toIso8601String(),
              }).toList());
          await _dao.markSynced(unsynced.map((l) => l.id).toList());
        }
      } catch (e) {
        log('syncLogs error: $e');
      }
    }

    return nativeData
        .where((a) => a.usageMinutes > 0)
        .map((a) => ScreenTimeEntry(
              packageName: a.packageName,
              appName: a.appName,
              usageMinutes: a.usageMinutes,
              category: a.category,
              date: todayStart,
            ))
        .toList();
  }

  // ── Read from local DB ──────────────────────────────────────

  Future<List<ScreenTimeEntry>> getEntriesForDate(DateTime date) async {
    final local = await _dao.getLogsForDate(date);
    return local.map(_toEntry).toList();
  }

  Future<List<ScreenTimeEntry>> getEntriesForRange(
    DateTime start,
    DateTime end,
  ) async {
    final local = await _dao.getLogsForRange(start, end);
    return local.map(_toEntry).toList();
  }

  Future<List<DailyTotal>> getDailyTotals(int days) async {
    final now = DateTime.now();
    final start = DateTime(now.year, now.month, now.day)
        .subtract(Duration(days: days - 1));
    final end = DateTime(now.year, now.month, now.day + 1);
    final entries = await _dao.getLogsForRange(start, end);

    final map = <String, int>{};
    for (final e in entries) {
      final key =
          '${e.date.year}-${e.date.month.toString().padLeft(2, '0')}-${e.date.day.toString().padLeft(2, '0')}';
      map[key] = (map[key] ?? 0) + e.usageMinutes;
    }

    final result = <DailyTotal>[];
    for (int i = 0; i < days; i++) {
      final d = start.add(Duration(days: i));
      final key =
          '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
      result.add(DailyTotal(date: d, totalMinutes: map[key] ?? 0));
    }
    return result;
  }

  // ── Limits ──────────────────────────────────────────────────

  Future<List<ScreenTimeLimit>> getLimits() async {
    if (await _isOnline()) {
      try {
        final remote = await _remote.getLimits();
        final companions = remote.map((m) => LocalScreenTimeLimitsCompanion(
              id: Value(m['id'] as String),
              packageName: Value(m['packageName'] as String?),
              category: Value(m['category'] as String?),
              dailyLimitMinutes: Value(m['dailyLimitMinutes'] as int),
              isActive: Value(m['isActive'] as bool? ?? true),
              createdAt: Value(
                m['createdAt'] != null
                    ? DateTime.parse(m['createdAt'] as String)
                    : DateTime.now(),
              ),
            )).toList();
        await _dao.upsertAllLimits(companions);
      } catch (e) {
        log('getLimits remote error: $e');
      }
    }
    final local = await _dao.getActiveLimits();
    return local.map(_toLimit).toList();
  }

  Future<void> createLimit({
    String? packageName,
    String? category,
    required int dailyLimitMinutes,
  }) async {
    final body = <String, dynamic>{
      'dailyLimitMinutes': dailyLimitMinutes,
      if (packageName != null) 'packageName': packageName,
      if (category != null) 'category': category,
    };

    if (await _isOnline()) {
      final data = await _remote.createLimit(body);
      await _dao.upsertLimit(LocalScreenTimeLimitsCompanion(
        id: Value(data['id'] as String),
        packageName: Value(packageName),
        category: Value(category),
        dailyLimitMinutes: Value(dailyLimitMinutes),
        isActive: const Value(true),
        createdAt: Value(DateTime.now()),
      ));
    }
  }

  Future<void> deleteLimit(String id) async {
    await _dao.deleteLimit(id);
    if (await _isOnline()) {
      try {
        await _remote.deleteLimit(id);
      } catch (e) {
        log('deleteLimit remote error: $e');
      }
    }
  }

  // ── Helpers ─────────────────────────────────────────────────

  ScreenTimeEntry _toEntry(LocalScreenTimeData d) => ScreenTimeEntry(
        packageName: d.packageName,
        appName: d.appName,
        usageMinutes: d.usageMinutes,
        category: d.category,
        date: d.date,
      );

  ScreenTimeLimit _toLimit(LocalScreenTimeLimitData d) => ScreenTimeLimit(
        id: d.id,
        packageName: d.packageName,
        category: d.category,
        dailyLimitMinutes: d.dailyLimitMinutes,
        isActive: d.isActive,
        createdAt: d.createdAt,
      );
}
