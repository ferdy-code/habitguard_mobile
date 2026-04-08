import 'dart:convert';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:json_annotation/json_annotation.dart';
import '../../../../core/database/app_database.dart';
import '../../domain/entities/focus_session.dart';

part 'focus_session_model.g.dart';

@JsonSerializable()
class FocusSessionModel {
  final String id;
  final String userId;
  final String type;
  final int focusMinutes;
  final int breakMinutes;
  @JsonKey(defaultValue: 0)
  final int actualFocusSeconds;
  final String status;
  final List<String>? blockedApps;
  final DateTime startedAt;
  final DateTime? endedAt;
  final DateTime createdAt;

  const FocusSessionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.focusMinutes,
    required this.breakMinutes,
    required this.actualFocusSeconds,
    required this.status,
    this.blockedApps,
    required this.startedAt,
    this.endedAt,
    required this.createdAt,
  });

  factory FocusSessionModel.fromJson(Map<String, dynamic> json) =>
      _$FocusSessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$FocusSessionModelToJson(this);

  FocusSession toEntity() => FocusSession(
        id: id,
        userId: userId,
        type: FocusType.values.firstWhere(
          (e) => e.name == type,
          orElse: () => FocusType.custom,
        ),
        focusMinutes: focusMinutes,
        breakMinutes: breakMinutes,
        actualFocusSeconds: actualFocusSeconds,
        status: FocusSessionStatus.values.firstWhere(
          (e) => e.name == status,
          orElse: () => FocusSessionStatus.completed,
        ),
        blockedApps: blockedApps ?? [],
        startedAt: startedAt,
        endedAt: endedAt,
        createdAt: createdAt,
      );

  LocalFocusSessionsCompanion toLocalCompanion() =>
      LocalFocusSessionsCompanion(
        id: Value(id),
        userId: Value(userId),
        type: Value(type),
        focusMinutes: Value(focusMinutes),
        breakMinutes: Value(breakMinutes),
        actualFocusSeconds: Value(actualFocusSeconds),
        status: Value(status),
        blockedApps: Value(
          blockedApps != null ? jsonEncode(blockedApps) : null,
        ),
        startedAt: Value(startedAt),
        endedAt: Value(endedAt),
        isSynced: const Value(true),
        createdAt: Value(createdAt),
      );
}
