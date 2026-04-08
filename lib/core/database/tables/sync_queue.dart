import 'package:drift/drift.dart';

@DataClassName('SyncQueueItemData')
class SyncQueue extends Table {
  @override
  String get tableName => 'sync_queue';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get entityType => text()(); // 'habit' | 'completion'
  TextColumn get entityId => text()();
  TextColumn get action => text()(); // 'create' | 'update' | 'delete'
  TextColumn get payload => text()(); // JSON
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
}
