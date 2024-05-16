import 'package:finance_buddy/index.dart';

import 'router_observer.dart';

class AppRouter {
  late final GoRouter router;

  static bool isAuth = false;

  static const home = '/';
  static const intro = '/intro';
  static const login = '/login';
  static const register = '/register';
  static const settings = '/settings';

  AppRouter() {
    _registerRouter();
  }

  void _registerRouter() {
    router = GoRouter(
      initialLocation: isAuth ? home : intro,
      observers: [
        RouterObserver(),
      ],
      routes: [
        GoRoute(
          path: intro,
          builder: (_, __) => const IntroView(),
        ),
        GoRoute(
          path: register,
          builder: (_, __) => const RegisterView(),
        ),
        GoRoute(
          path: login,
          builder: (_, __) => const LoginView(),
        ),
        GoRoute(
          path: home,
          builder: (_, __) => const HomeView(),
        ),
      ],
    );
  }
}
