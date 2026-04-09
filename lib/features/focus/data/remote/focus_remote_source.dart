import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/app_exception.dart';
import '../models/focus_session_model.dart';

class FocusRemoteSource {
  final Dio _dio;

  FocusRemoteSource(this._dio);

  Future<List<FocusSessionModel>> getSessions() async {
    try {
      final res = await _dio.get(ApiEndpoints.focusSessions);
      final raw = (res.data as Map<String, dynamic>)['data'];
      // Backend may return list directly or wrapped: {sessions: [...]}
      final list = raw is List
          ? raw
          : raw is Map
              ? (raw['sessions'] ?? raw['items'] ?? raw['data'] ?? []) as List
              : <dynamic>[];
      return list
          .map((j) => FocusSessionModel.fromJson(j as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<FocusSessionModel> createSession(Map<String, dynamic> body) async {
    try {
      final res = await _dio.post(ApiEndpoints.focusSessions, data: body);
      return FocusSessionModel.fromJson(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<FocusSessionModel> endSession(
    String id,
    Map<String, dynamic> body,
  ) async {
    try {
      final res =
          await _dio.patch(ApiEndpoints.focusSessionEnd(id), data: body);
      return FocusSessionModel.fromJson(
        (res.data as Map<String, dynamic>)['data'] as Map<String, dynamic>,
      );
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
