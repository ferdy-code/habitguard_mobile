import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/completion.dart';
import '../../../../core/database/app_database.dart';

part 'completion_model.g.dart';

@JsonSerializable()
class CompletionModel {
  final String id;
  final String habitId;
  final DateTime completedAt;
  final String? note;
  final int count;

  const CompletionModel({
    required this.id,
    required this.habitId,
    required this.completedAt,
    this.note,
    this.count = 1,
  });

  factory CompletionModel.fromJson(Map<String, dynamic> json) {
    final base = _$CompletionModelFromJson(json);
    // count may be absent from API responses; default to 1
    return json.containsKey('count') ? base : base._copyWithCount(1);
  }

  CompletionModel _copyWithCount(int c) => CompletionModel(
        id: id,
        habitId: habitId,
        completedAt: completedAt,
        note: note,
        count: c,
      );

  Map<String, dynamic> toJson() => _$CompletionModelToJson(this);

  Completion toEntity() => Completion(
        id: id,
        habitId: habitId,
        completedAt: completedAt,
        note: note,
        count: count,
      );

  LocalCompletionsCompanion toLocalCompanion() => LocalCompletionsCompanion(
        id: Value(id),
        habitId: Value(habitId),
        completedAt: Value(completedAt),
        note: Value(note),
        count: Value(count),
        isSynced: const Value(true),
      );
}
