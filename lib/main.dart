import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/presentation/auth/welcome.dart';
import 'package:mest/presentation/auth/splash.dart';
import 'package:mest/presentation/dashboard/base.dart';
import 'package:mest/routes/routes.dart';

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
      path: AppRoute.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return const Dashboard();
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: AppRoute.home,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const HomeScreen();
      //     },
      //   ),
      //   GoRoute(
      //     path: AppRoute.plan,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const MenuScreen();
      //     },
      //   ),
      //   GoRoute(
      //     path: AppRoute.history,
      //     builder: (BuildContext context, GoRouterState state) {
      //       return const HistoryScreen();
      //     },
      //   ),
      // ],
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
