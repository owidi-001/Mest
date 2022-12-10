import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/presentation/history/history_info.dart';
import 'package:mest/presentation/home/home.dart';
import 'package:mest/presentation/intro/splash.dart';
import 'package:mest/presentation/menu/menu_plan.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/widgets/bottom_navigation.dart';

void main() {
  runApp(App());
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
      path: AppRoute.home,
      builder: (BuildContext context, GoRouterState state) {
        return const BottomNavigation();
      },
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.plan,
          builder: (BuildContext context, GoRouterState state) {
            return const MenuScreen();
          },
        ),
        GoRoute(
          path: AppRoute.history,
          builder: (BuildContext context, GoRouterState state) {
            return const HistoryScreen();
          },
        ),
      ],
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
