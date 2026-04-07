import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../remote/auth_remote_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remote;
  final FlutterSecureStorage _storage;

  static const _keyAccessToken = 'access_token';
  static const _keyRefreshToken = 'refresh_token';

  AuthRepositoryImpl(this._remote, this._storage);

  @override
  Future<({User user, String accessToken, String refreshToken})> login({
    required String email,
    required String password,
  }) async {
    final result = await _remote.login(email: email, password: password);
    await _saveTokens(
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
    );
    return (
      user: result.user.toEntity(),
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
    );
  }

  @override
  Future<({User user, String accessToken, String refreshToken})> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    final result = await _remote.register(
      email: email,
      password: password,
      displayName: displayName,
    );
    await _saveTokens(
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
    );
    return (
      user: result.user.toEntity(),
      accessToken: result.accessToken,
      refreshToken: result.refreshToken,
    );
  }

  @override
  Future<void> logout() async {
    try {
      await _remote.logout();
    } finally {
      await _clearTokens();
    }
  }

  @override
  Future<User> getProfile() async {
    return (await _remote.getProfile()).toEntity();
  }

  @override
  Future<User> updateProfile({
    String? displayName,
    String? avatarUrl,
    String? timezone,
    int? dailyScreenLimitMinutes,
  }) async {
    final model = await _remote.updateProfile(
      displayName: displayName,
      avatarUrl: avatarUrl,
      timezone: timezone,
      dailyScreenLimitMinutes: dailyScreenLimitMinutes,
    );
    return model.toEntity();
  }

  @override
  Future<String> refreshToken(String refreshToken) async {
    final newToken = await _remote.refreshToken(refreshToken);
    await _storage.write(key: _keyAccessToken, value: newToken);
    return newToken;
  }

  Future<String?> getStoredAccessToken() =>
      _storage.read(key: _keyAccessToken);

  Future<String?> getStoredRefreshToken() =>
      _storage.read(key: _keyRefreshToken);

  Future<void> _saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _keyAccessToken, value: accessToken),
      _storage.write(key: _keyRefreshToken, value: refreshToken),
    ]);
  }

  Future<void> _clearTokens() async {
    await Future.wait([
      _storage.delete(key: _keyAccessToken),
      _storage.delete(key: _keyRefreshToken),
    ]);
  }
}
