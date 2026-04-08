import 'package:drift/drift.dart';

@DataClassName('LocalScreenTimeData')
class LocalScreenTime extends Table {
  @override
  String get tableName => 'local_screen_time';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get packageName => text()();
  TextColumn get appName => text()();
  IntColumn get usageMinutes => integer()();
  TextColumn get category => text()();
  DateTimeColumn get date => dateTime()();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
}

@DataClassName('LocalScreenTimeLimitData')
class LocalScreenTimeLimits extends Table {
  @override
  String get tableName => 'local_screen_time_limits';

  TextColumn get id => text()();
  TextColumn get packageName => text().nullable()();
  TextColumn get category => text().nullable()();
  IntColumn get dailyLimitMinutes => integer()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
