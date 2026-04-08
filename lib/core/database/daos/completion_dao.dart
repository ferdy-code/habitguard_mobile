import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/local_completions.dart';
import '../tables/sync_queue.dart';

part 'completion_dao.g.dart';

@DriftAccessor(tables: [LocalCompletions, SyncQueue])
class CompletionDao extends DatabaseAccessor<AppDatabase>
    with _$CompletionDaoMixin {
  CompletionDao(super.db);

  Future<List<LocalCompletionData>> getCompletionsForDate(DateTime date) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(localCompletions)
          ..where(
            (t) =>
                t.completedAt.isBiggerOrEqualValue(start) &
                t.completedAt.isSmallerThanValue(end),
          ))
        .get();
  }

  Future<List<LocalCompletionData>> getCompletionsForHabit(String habitId) =>
      (select(localCompletions)
            ..where((t) => t.habitId.equals(habitId))
            ..orderBy([(t) => OrderingTerm.desc(t.completedAt)]))
          .get();

  Future<List<LocalCompletionData>> getCompletionsForHabitInRange(
    String habitId,
    DateTime start,
    DateTime end,
  ) =>
      (select(localCompletions)
            ..where(
              (t) =>
                  t.habitId.equals(habitId) &
                  t.completedAt.isBiggerOrEqualValue(start) &
                  t.completedAt.isSmallerThanValue(end),
            )
            ..orderBy([(t) => OrderingTerm.desc(t.completedAt)]))
          .get();

  Future<LocalCompletionData?> getCompletionForHabitOnDate(
    String habitId,
    DateTime date,
  ) {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return (select(localCompletions)
          ..where(
            (t) =>
                t.habitId.equals(habitId) &
                t.completedAt.isBiggerOrEqualValue(start) &
                t.completedAt.isSmallerThanValue(end),
          )
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> upsertCompletion(LocalCompletionsCompanion companion) =>
      into(localCompletions).insertOnConflictUpdate(companion);

  Future<int> deleteCompletion(String id) =>
      (delete(localCompletions)..where((t) => t.id.equals(id))).go();

  Future<void> addToSyncQueue(SyncQueueCompanion item) =>
      into(syncQueue).insert(item);
}
