import 'package:freezed_annotation/freezed_annotation.dart';

part 'screen_time_entry.freezed.dart';

@freezed
abstract class ScreenTimeEntry with _$ScreenTimeEntry {
  const factory ScreenTimeEntry({
    required String packageName,
    required String appName,
    required int usageMinutes,
    required String category,
    required DateTime date,
  }) = _ScreenTimeEntry;
}

@freezed
abstract class ScreenTimeLimit with _$ScreenTimeLimit {
  const factory ScreenTimeLimit({
    required String id,
    String? packageName,
    String? category,
    required int dailyLimitMinutes,
    @Default(true) bool isActive,
    required DateTime createdAt,
  }) = _ScreenTimeLimit;
}

@freezed
abstract class DailyTotal with _$DailyTotal {
  const factory DailyTotal({
    required DateTime date,
    required int totalMinutes,
  }) = _DailyTotal;
}

@freezed
abstract class CategoryBreakdown with _$CategoryBreakdown {
  const factory CategoryBreakdown({
    required String category,
    required int totalMinutes,
    required double percentage,
  }) = _CategoryBreakdown;
}
