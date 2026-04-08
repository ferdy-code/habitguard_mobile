import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/local_screen_time.dart';

part 'screen_time_dao.g.dart';

@DriftAccessor(tables: [LocalScreenTime, LocalScreenTimeLimits])
class ScreenTimeDao extends DatabaseAccessor<AppDatabase>
    with _$ScreenTimeDaoMixin {
  ScreenTimeDao(super.db);

  // ── Logs ──────────────────────────────────────────────────────

  Future<List<LocalScreenTimeData>> getLogsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(localScreenTime)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerThanValue(end))
          ..orderBy([(t) => OrderingTerm.desc(t.usageMinutes)]))
        .get();
  }

  Future<List<LocalScreenTimeData>> getLogsForRange(
    DateTime start,
    DateTime end,
  ) {
    return (select(localScreenTime)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerThanValue(end))
          ..orderBy([(t) => OrderingTerm.desc(t.usageMinutes)]))
        .get();
  }

  Future<void> insertLogs(List<LocalScreenTimeCompanion> companions) =>
      batch((b) => b.insertAll(localScreenTime, companions));

  Future<int> deleteLogsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (delete(localScreenTime)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerThanValue(end)))
        .go();
  }

  Future<List<LocalScreenTimeData>> getUnsyncedLogs() =>
      (select(localScreenTime)..where((t) => t.isSynced.equals(false))).get();

  Future<void> markSynced(List<int> ids) {
    return (update(localScreenTime)
          ..where((t) => t.id.isIn(ids)))
        .write(const LocalScreenTimeCompanion(isSynced: Value(true)));
  }

  // ── Limits ────────────────────────────────────────────────────

  Future<List<LocalScreenTimeLimitData>> getActiveLimits() =>
      (select(localScreenTimeLimits)
            ..where((t) => t.isActive.equals(true)))
          .get();

  Future<void> upsertLimit(LocalScreenTimeLimitsCompanion companion) =>
      into(localScreenTimeLimits).insertOnConflictUpdate(companion);

  Future<void> upsertAllLimits(
    List<LocalScreenTimeLimitsCompanion> companions,
  ) =>
      batch((b) =>
          b.insertAllOnConflictUpdate(localScreenTimeLimits, companions));

  Future<int> deleteLimit(String id) =>
      (delete(localScreenTimeLimits)..where((t) => t.id.equals(id))).go();
}
