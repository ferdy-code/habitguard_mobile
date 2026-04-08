import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_database.dart';
import 'daos/habit_dao.dart';
import 'daos/completion_dao.dart';
import 'daos/screen_time_dao.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final habitDaoProvider = Provider<HabitDao>(
  (ref) => ref.watch(databaseProvider).habitDao,
);

final completionDaoProvider = Provider<CompletionDao>(
  (ref) => ref.watch(databaseProvider).completionDao,
);

final screenTimeDaoProvider = Provider<ScreenTimeDao>(
  (ref) => ref.watch(databaseProvider).screenTimeDao,
);
