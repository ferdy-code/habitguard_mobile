import 'package:drift/drift.dart';

@DataClassName('LocalFocusSessionData')
class LocalFocusSessions extends Table {
  @override
  String get tableName => 'local_focus_sessions';

  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get type => text()();
  IntColumn get focusMinutes => integer()();
  IntColumn get breakMinutes => integer()();
  IntColumn get actualFocusSeconds => integer().withDefault(const Constant(0))();
  TextColumn get status => text()();
  TextColumn get blockedApps => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
