import 'package:dio/dio.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/errors/app_exception.dart';
import '../models/user_model.dart';

class AuthRemoteSource {
  final Dio _dio;

  AuthRemoteSource(this._dio);

  Future<({UserModel user, String accessToken, String refreshToken})> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      return _parseAuthResponse(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<({UserModel user, String accessToken, String refreshToken})> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.register,
        data: {
          'email': email,
          'password': password,
          'displayName': displayName,
        },
      );
      return _parseAuthResponse(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<void> logout() async {
    try {
      await _dio.post(ApiEndpoints.logout);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<UserModel> getProfile() async {
    try {
      final response = await _dio.get(ApiEndpoints.me);
      final data = (response.data as Map<String, dynamic>)['data'];
      return UserModel.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<UserModel> updateProfile({
    String? displayName,
    String? avatarUrl,
    String? timezone,
    int? dailyScreenLimitMinutes,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (displayName != null) body['displayName'] = displayName;
      if (avatarUrl != null) body['avatarUrl'] = avatarUrl;
      if (timezone != null) body['timezone'] = timezone;
      if (dailyScreenLimitMinutes != null) {
        body['dailyScreenLimitMinutes'] = dailyScreenLimitMinutes;
      }

      final response = await _dio.patch(ApiEndpoints.me, data: body);
      final data = (response.data as Map<String, dynamic>)['data'];
      return UserModel.fromJson(data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<String> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );
      final data = (response.data as Map<String, dynamic>)['data'];
      return data['accessToken'] as String;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  ({UserModel user, String accessToken, String refreshToken}) _parseAuthResponse(
    Map<String, dynamic> body,
  ) {
    final data = body['data'] as Map<String, dynamic>;
    return (
      user: UserModel.fromJson(data['user'] as Map<String, dynamic>),
      accessToken: data['accessToken'] as String,
      refreshToken: data['refreshToken'] as String,
    );
  }

  AppException _mapDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final responseData = e.response?.data;
    final message = responseData is Map ? (responseData['message'] as String?) : null;

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.connectionError) {
      return const NetworkException();
    }

    if (statusCode == 401) return const UnauthorizedException();
    if (statusCode == 404) return const NotFoundException();
    if (statusCode == 422) {
      return ValidationException(
        message: message ?? 'Data tidak valid',
        validationErrors: _extractErrors(responseData),
      );
    }
    if (statusCode != null && statusCode >= 500) return const ServerException();
    return AppException(message: message ?? 'Terjadi kesalahan', statusCode: statusCode);
  }

  List<String> _extractErrors(dynamic data) {
    if (data is Map && data['errors'] is List) {
      return (data['errors'] as List).map((e) => e.toString()).toList();
    }
    return [];
  }
}
