import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/network/api_client.dart';
import '../../data/remote/auth_remote_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/user.dart';

// ---------- Infrastructure providers ----------

final _secureStorageProvider = Provider<FlutterSecureStorage>(
  (_) => const FlutterSecureStorage(),
);

final _authRemoteSourceProvider = Provider<AuthRemoteSource>(
  (ref) => AuthRemoteSource(ref.watch(apiClientProvider)),
);

final authRepositoryProvider = Provider<AuthRepositoryImpl>(
  (ref) => AuthRepositoryImpl(
    ref.watch(_authRemoteSourceProvider),
    ref.watch(_secureStorageProvider),
  ),
);

// ---------- Auth state ----------

sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

// ---------- AsyncNotifier ----------

class AuthNotifier extends AsyncNotifier<AuthState> {
  AuthRepositoryImpl get _repo => ref.read(authRepositoryProvider);

  @override
  Future<AuthState> build() async {
    return await _tryAutoLogin();
  }

  Future<AuthState> _tryAutoLogin() async {
    final token = await _repo.getStoredAccessToken();
    if (token == null) return const AuthUnauthenticated();

    try {
      final user = await _repo.getProfile();
      return AuthAuthenticated(user);
    } catch (_) {
      return const AuthUnauthenticated();
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _repo.login(email: email, password: password);
      return AuthAuthenticated(result.user);
    });
  }

  Future<void> register({
    required String email,
    required String password,
    required String displayName,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final result = await _repo.register(
        email: email,
        password: password,
        displayName: displayName,
      );
      return AuthAuthenticated(result.user);
    });
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await _repo.logout();
      return const AuthUnauthenticated();
    });
  }

  Future<void> refreshUser() async {
    final user = await _repo.getProfile();
    state = AsyncData(AuthAuthenticated(user));
  }
}

final authStateProvider =
    AsyncNotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

// ---------- Derived providers ----------

final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authStateProvider).asData?.value;
  return authState is AuthAuthenticated ? authState.user : null;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider).asData?.value;
  return authState is AuthAuthenticated;
});
