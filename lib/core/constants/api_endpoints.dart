class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String me = '/auth/me';

  // Habits
  static const String habits = '/habits';
  static String habitById(String id) => '/habits/$id';
  static String habitComplete(String id) => '/habits/$id/complete';
  static String habitCompletions(String id) => '/habits/$id/completions';
  static String habitStreak(String id) => '/habits/$id/streak';

  // Screen Time
  static const String screenTimeLogs = '/screen-time/logs';
  static const String screenTimeSummary = '/screen-time/summary';
  static const String screenTimeLimits = '/screen-time/limits';
  static String screenTimeLimitById(String id) => '/screen-time/limits/$id';

  // Focus Sessions
  static const String focusSessions = '/focus-sessions';
  static String focusSessionById(String id) => '/focus-sessions/$id';
  static String focusSessionEnd(String id) => '/focus-sessions/$id/end';

  // AI Coach
  static const String aiChat = '/ai/chat';
  static const String aiInsights = '/ai/insights';
  static const String aiDailySummary = '/ai/daily-summary';

  // Daily Summaries
  static const String dailySummaries = '/daily-summaries';
}
