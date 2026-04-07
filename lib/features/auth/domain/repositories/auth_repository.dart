import '../entities/user.dart';

abstract class AuthRepository {
  Future<({User user, String accessToken, String refreshToken})> login({
    required String email,
    required String password,
  });

  Future<({User user, String accessToken, String refreshToken})> register({
    required String email,
    required String password,
    required String displayName,
  });

  Future<void> logout();

  Future<User> getProfile();

  Future<User> updateProfile({
    String? displayName,
    String? avatarUrl,
    String? timezone,
    int? dailyScreenLimitMinutes,
  });

  Future<String> refreshToken(String refreshToken);
}
