abstract class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Tidak ada koneksi internet']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Sesi berakhir, silakan login kembali']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Data tidak ditemukan']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Terjadi kesalahan server']);
}

class ValidationFailure extends Failure {
  final List<String> errors;
  const ValidationFailure(super.message, {this.errors = const []});
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Gagal memuat data lokal']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Terjadi kesalahan tidak diketahui']);
}
