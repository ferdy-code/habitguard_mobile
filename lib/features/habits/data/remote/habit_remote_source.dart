import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/app_exception.dart';
import '../../domain/entities/habit.dart';
import '../models/habit_model.dart';
import '../models/completion_model.dart';

class CreateHabitRequest {
  final String title;
  final String? description;
  final String emoji;
  final String color;
  final HabitFrequency frequency;
  final int? customDays;
  final int targetCount;
  final String? category;
  final bool reminderEnabled;
  final String? reminderTime;

  const CreateHabitRequest({
    required this.title,
    this.description,
    required this.emoji,
    required this.color,
    required this.frequency,
    this.customDays,
    required this.targetCount,
    this.category,
    required this.reminderEnabled,
    this.reminderTime,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    if (description != null) 'description': description,
    'emoji': emoji,
    'color': color,
    'frequency': frequency.name,
    if (customDays != null) 'customDays': customDays,
    'targetCount': targetCount,
    if (category != null) 'category': category,
    'reminderEnabled': reminderEnabled,
    if (reminderTime != null) 'reminderTime': reminderTime,
  };
}

class UpdateHabitRequest {
  final String? title;
  final String? description;
  final String? emoji;
  final String? color;
  final HabitFrequency? frequency;
  final int? customDays;
  final int? targetCount;
  final String? category;
  final bool? reminderEnabled;
  final String? reminderTime;
  final int? sortOrder;

  const UpdateHabitRequest({
    this.title,
    this.description,
    this.emoji,
    this.color,
    this.frequency,
    this.customDays,
    this.targetCount,
    this.category,
    this.reminderEnabled,
    this.reminderTime,
    this.sortOrder,
  });

  Map<String, dynamic> toJson() => {
    if (title != null) 'title': title,
    if (description != null) 'description': description,
    if (emoji != null) 'emoji': emoji,
    if (color != null) 'color': color,
    if (frequency != null) 'frequency': frequency!.name,
    if (customDays != null) 'customDays': customDays,
    if (targetCount != null) 'targetCount': targetCount,
    if (category != null) 'category': category,
    if (reminderEnabled != null) 'reminderEnabled': reminderEnabled,
    if (reminderTime != null) 'reminderTime': reminderTime,
    if (sortOrder != null) 'sortOrder': sortOrder,
  };
}

class HabitRemoteSource {
  final Dio _dio;

  HabitRemoteSource(this._dio);

  Future<List<HabitModel>> getHabits() async {
    try {
      final res = await _dio.get(ApiEndpoints.habits);
      final data = (res.data as Map<String, dynamic>)['data'] as List;
      return data
          .map((j) => HabitModel.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<HabitModel> getHabitById(String id) async {
    try {
      final res = await _dio.get(ApiEndpoints.habitById(id));
      return HabitModel.fromJson(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<HabitModel> createHabit(CreateHabitRequest req) async {
    try {
      final res = await _dio.post(ApiEndpoints.habits, data: req.toJson());
      return HabitModel.fromJson(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<HabitModel> updateHabit(String id, UpdateHabitRequest req) async {
    try {
      final res = await _dio.patch(
        ApiEndpoints.habitById(id),
        data: req.toJson(),
      );
      return HabitModel.fromJson(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<void> archiveHabit(String id) async {
    try {
      await _dio.patch(ApiEndpoints.habitById(id), data: {'isArchived': true});
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<({bool completed, CompletionModel? completion})> toggleCompletion(
    String habitId,
    DateTime date, {
    String? note,
  }) async {
    try {
      final res = await _dio.post(
        ApiEndpoints.habitComplete(habitId),
        data: {
          'completedAt': date.toIso8601String(),
          if (note != null) 'note': note,
        },
      );
      final data =
          (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>;
      final completed = data['completed'] as bool;
      final completionJson = data['completion'] as Map<String, dynamic>?;
      return (
        completed: completed,
        completion: completionJson != null
            ? CompletionModel.fromJson(completionJson)
            : null,
      );
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<List<CompletionModel>> getCompletionsForHabit(
    String habitId, {
    DateTime? from,
    DateTime? to,
  }) async {
    try {
      final params = <String, dynamic>{};
      if (from != null) params['from'] = from.toIso8601String();
      if (to != null) params['to'] = to.toIso8601String();
      final res = await _dio.get(
        ApiEndpoints.habitCompletions(habitId),
        queryParameters: params.isNotEmpty ? params : null,
      );
      final data = (res.data as Map<String, dynamic>)['data'] as List;
      return data
          .map((j) => CompletionModel.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  AppException _map(DioException e) {
    final statusCode = e.response?.statusCode;
    final msg = (e.response?.data is Map)
        ? (e.response!.data as Map)['message'] as String?
        : null;

    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      return const NetworkException();
    }
    if (statusCode == 401) return const UnauthorizedException();
    if (statusCode == 404) return const NotFoundException();
    if (statusCode != null && statusCode >= 500) return const ServerException();
    return AppException(
      message: msg ?? 'Terjadi kesalahan',
      statusCode: statusCode,
    );
  }
}
