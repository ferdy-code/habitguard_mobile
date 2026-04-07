class AppException implements Exception {
  final String message;
  final String? code;
  final int? statusCode;

  const AppException({
    required this.message,
    this.code,
    this.statusCode,
  });

  @override
  String toString() => 'AppException(message: $message, code: $code, statusCode: $statusCode)';
}

class NetworkException extends AppException {
  const NetworkException({super.message = 'Tidak ada koneksi internet', super.code = 'NETWORK_ERROR'});
}

class UnauthorizedException extends AppException {
  const UnauthorizedException({super.message = 'Sesi berakhir, silakan login kembali', super.statusCode = 401, super.code = 'UNAUTHORIZED'});
}

class NotFoundException extends AppException {
  const NotFoundException({super.message = 'Data tidak ditemukan', super.statusCode = 404, super.code = 'NOT_FOUND'});
}

class ServerException extends AppException {
  const ServerException({super.message = 'Terjadi kesalahan server', super.statusCode = 500, super.code = 'SERVER_ERROR'});
}

class ValidationException extends AppException {
  final List<String> validationErrors;

  const ValidationException({
    super.message = 'Data tidak valid',
    super.statusCode = 422,
    super.code = 'VALIDATION_ERROR',
    this.validationErrors = const [],
  });
}
