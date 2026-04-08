import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/habits/presentation/screens/habits_screen.dart';
import '../../features/habits/presentation/screens/create_habit_screen.dart';
import '../../features/habits/presentation/screens/habit_detail_screen.dart';
import '../../features/habits/domain/entities/habit.dart';
import '../../features/screen_time/presentation/screens/screen_time_screen.dart';
import '../../features/screen_time/presentation/screens/app_detail_screen.dart';
import '../../features/screen_time/presentation/screens/limits_screen.dart';
import '../../features/screen_time/domain/entities/screen_time_entry.dart';
import '../../features/focus/presentation/screens/focus_screen.dart';
import '../../features/ai_coach/presentation/screens/ai_coach_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    redirect: (context, state) {
      final authAsync = ref.read(authStateProvider);

      // While loading auth state, stay put
      if (authAsync.isLoading) return null;

      final isAuthenticated = ref.read(isAuthenticatedProvider);
      final loc = state.matchedLocation;

      final isAuthRoute = loc == '/login' || loc == '/register';
      final isOnboarding = loc == '/onboarding';

      if (!isAuthenticated && !isAuthRoute && !isOnboarding) return '/login';
      if (isAuthenticated && isAuthRoute) return '/home';

      return null;
    },
    refreshListenable: _AuthStateListenable(ref),
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => _ScaffoldWithNavBar(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/habits',
            builder: (context, state) => const HabitsScreen(),
            routes: [
              GoRoute(
                path: 'create',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => CreateHabitScreen(
                  editingHabit: state.extra as Habit?,
                ),
              ),
              GoRoute(
                path: ':id',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => HabitDetailScreen(
                  habitId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/screen-time',
            builder: (context, state) => const ScreenTimeScreen(),
            routes: [
              GoRoute(
                path: 'app/:pkg',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => AppDetailScreen(
                  packageName: Uri.decodeComponent(
                      state.pathParameters['pkg']!),
                  initial: state.extra as ScreenTimeEntry?,
                ),
              ),
              GoRoute(
                path: 'limits',
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) => const LimitsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/focus',
            builder: (context, state) => const FocusScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/ai-coach',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const AiCoachScreen(),
      ),
      GoRoute(
        path: '/settings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );

  return router;
});

/// Notifies GoRouter to re-evaluate redirect when auth state changes.
class _AuthStateListenable extends ChangeNotifier {
  _AuthStateListenable(Ref ref) {
    ref.listen(authStateProvider, (_, __) => notifyListeners());
  }
}

class _ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const _ScaffoldWithNavBar({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex(context),
        onDestinationSelected: (index) => _onItemTapped(context, index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.check_circle_outline),
            selectedIcon: Icon(Icons.check_circle),
            label: 'Habits',
          ),
          NavigationDestination(
            icon: Icon(Icons.phone_android_outlined),
            selectedIcon: Icon(Icons.phone_android),
            label: 'Screen Time',
          ),
          NavigationDestination(
            icon: Icon(Icons.timer_outlined),
            selectedIcon: Icon(Icons.timer),
            label: 'Focus',
          ),
        ],
      ),
    );
  }

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/habits')) return 1;
    if (location.startsWith('/screen-time')) return 2;
    if (location.startsWith('/focus')) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0: context.go('/home');
      case 1: context.go('/habits');
      case 2: context.go('/screen-time');
      case 3: context.go('/focus');
    }
  }
}
