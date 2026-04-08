import 'package:freezed_annotation/freezed_annotation.dart';

part 'completion.freezed.dart';

@freezed
abstract class Completion with _$Completion {
  const factory Completion({
    required String id,
    required String habitId,
    required DateTime completedAt,
    String? note,
    @Default(1) int count,
  }) = _Completion;
}
