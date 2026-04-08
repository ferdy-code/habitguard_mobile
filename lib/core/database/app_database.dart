import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'tables/local_habits.dart';
import 'tables/local_completions.dart';
import 'tables/sync_queue.dart';
import 'daos/habit_dao.dart';
import 'daos/completion_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [LocalHabits, LocalCompletions, SyncQueue],
  daos: [HabitDao, CompletionDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'habitguard.db'));
      return NativeDatabase.createInBackground(file);
    });
  }
}
