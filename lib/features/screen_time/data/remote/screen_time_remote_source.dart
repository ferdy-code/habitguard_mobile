import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/app_exception.dart';

class ScreenTimeRemoteSource {
  final Dio _dio;

  ScreenTimeRemoteSource(this._dio);

  Future<void> syncLogs(List<Map<String, dynamic>> logs) async {
    try {
      await _dio.post(ApiEndpoints.screenTimeLogs, data: {'logs': logs});
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<List<Map<String, dynamic>>> getSummary({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final res = await _dio.get(
        ApiEndpoints.screenTimeSummary,
        queryParameters: {
          'from': from.toIso8601String(),
          'to': to.toIso8601String(),
        },
      );
      final data = (res.data as Map<String, dynamic>)['data'];
      if (data is List) return data.cast<Map<String, dynamic>>();
      return [];
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<List<Map<String, dynamic>>> getLimits() async {
    try {
      final res = await _dio.get(ApiEndpoints.screenTimeLimits);
      final data = (res.data as Map<String, dynamic>)['data'];
      if (data is List) return data.cast<Map<String, dynamic>>();
      return [];
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<Map<String, dynamic>> createLimit(Map<String, dynamic> body) async {
    try {
      final res =
          await _dio.post(ApiEndpoints.screenTimeLimits, data: body);
      return (res.data as Map<String, dynamic>)['data']
          as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _map(e);
    }
  }

  Future<void> deleteLimit(String id) async {
    try {
      await _dio.delete(ApiEndpoints.screenTimeLimitById(id));
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
