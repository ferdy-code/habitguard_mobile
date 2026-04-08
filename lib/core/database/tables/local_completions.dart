import 'package:drift/drift.dart';

@DataClassName('LocalCompletionData')
class LocalCompletions extends Table {
  @override
  String get tableName => 'local_completions';

  TextColumn get id => text()();
  TextColumn get habitId => text()();
  DateTimeColumn get completedAt => dateTime()();
  TextColumn get note => text().nullable()();
  IntColumn get count => integer().withDefault(const Constant(1))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
