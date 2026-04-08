import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/local_habits.dart';
import '../tables/sync_queue.dart';

part 'habit_dao.g.dart';

@DriftAccessor(tables: [LocalHabits, SyncQueue])
class HabitDao extends DatabaseAccessor<AppDatabase> with _$HabitDaoMixin {
  HabitDao(super.db);

  Stream<List<LocalHabitData>> watchActiveHabits() =>
      (select(localHabits)
            ..where((t) => t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .watch();

  Future<List<LocalHabitData>> getActiveHabits() =>
      (select(localHabits)
            ..where((t) => t.isArchived.equals(false))
            ..orderBy([(t) => OrderingTerm.asc(t.sortOrder)]))
          .get();

  Future<LocalHabitData?> getHabitById(String id) =>
      (select(localHabits)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<void> upsertHabit(LocalHabitsCompanion companion) =>
      into(localHabits).insertOnConflictUpdate(companion);

  Future<void> upsertAll(List<LocalHabitsCompanion> companions) =>
      batch((b) => b.insertAllOnConflictUpdate(localHabits, companions));

  Future<int> deleteHabit(String id) =>
      (delete(localHabits)..where((t) => t.id.equals(id))).go();

  Future<void> addToSyncQueue(SyncQueueCompanion item) =>
      into(syncQueue).insert(item);
}
