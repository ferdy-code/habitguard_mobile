import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/local_focus_sessions.dart';

part 'focus_session_dao.g.dart';

@DriftAccessor(tables: [LocalFocusSessions])
class FocusSessionDao extends DatabaseAccessor<AppDatabase>
    with _$FocusSessionDaoMixin {
  FocusSessionDao(super.db);

  Future<List<LocalFocusSessionData>> getAllSessions() =>
      (select(localFocusSessions)
            ..orderBy([(t) => OrderingTerm.desc(t.startedAt)]))
          .get();

  Future<List<LocalFocusSessionData>> getSessionsForRange(
    DateTime start,
    DateTime end,
  ) {
    return (select(localFocusSessions)
          ..where((t) =>
              t.startedAt.isBiggerOrEqualValue(start) &
              t.startedAt.isSmallerThanValue(end))
          ..orderBy([(t) => OrderingTerm.desc(t.startedAt)]))
        .get();
  }

  Future<void> upsertSession(LocalFocusSessionsCompanion companion) =>
      into(localFocusSessions).insertOnConflictUpdate(companion);

  Future<void> upsertAll(List<LocalFocusSessionsCompanion> companions) =>
      batch((b) =>
          b.insertAllOnConflictUpdate(localFocusSessions, companions));

  Future<List<LocalFocusSessionData>> getUnsyncedSessions() =>
      (select(localFocusSessions)
            ..where((t) => t.isSynced.equals(false)))
          .get();

  Future<void> markSynced(String id) {
    return (update(localFocusSessions)..where((t) => t.id.equals(id)))
        .write(const LocalFocusSessionsCompanion(isSynced: Value(true)));
  }
}
