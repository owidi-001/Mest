import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/features/auth/login.dart';
import 'package:mest/features/auth/register.dart';
import 'package:mest/features/auth/welcome.dart';
import 'package:mest/features/auth/splash.dart';
import 'package:mest/features/dashboard/base.dart';
import 'package:mest/shared/routes/routes.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: AppRoute.splash,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoute.welcome,
      builder: (BuildContext context, GoRouterState state) {
        return const Welcome();
      },
    ),
    GoRoute(
      path: AppRoute.login,
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
    ),
    GoRoute(
      path: AppRoute.register,
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
    GoRoute(
      path: AppRoute.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return const Dashboard();
      },
    ),
  ],
);

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
