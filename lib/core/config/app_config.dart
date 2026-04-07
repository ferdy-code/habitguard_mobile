class AppConfig {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://192.168.24.249:8000/api/v1',
  );

  static const String appName = 'HabitGuard';
  static const int connectTimeoutMs = 30000;
  static const int receiveTimeoutMs = 30000;
}
