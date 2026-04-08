import 'package:drift/drift.dart';

@DataClassName('LocalHabitData')
class LocalHabits extends Table {
  @override
  String get tableName => 'local_habits';

  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get emoji => text().withDefault(const Constant('⭐'))();
  TextColumn get color => text().withDefault(const Constant('#4CAF50'))();
  TextColumn get frequency => text().withDefault(const Constant('daily'))();
  TextColumn get customDays => text().nullable()(); // JSON "[1,3,5]"
  IntColumn get targetCount => integer().withDefault(const Constant(1))();
  TextColumn get category => text().nullable()();
  BoolColumn get reminderEnabled => boolean().withDefault(const Constant(false))();
  TextColumn get reminderTime => text().nullable()(); // "HH:mm"
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
