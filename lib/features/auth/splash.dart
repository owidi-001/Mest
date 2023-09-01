import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/shared/core/prefs/app_prefs.dart';
import 'package:mest/shared/core/prefs/user_prefs.dart';
import 'package:mest/shared/core/provider/auth_provider.dart';
import 'package:mest/shared/data/models/user/user_model.dart';
import 'package:mest/shared/routes/routes.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), _initialize);
  }

  Future<void> _initialize() async {
    AppPreferences().boarded().then((value) {
      if (value) {
        // Check if logged in
        UserPreferences().loadUserData().then((value) {
          if (value != null) {
            User user = value.user;
            // save user and redirect to dashboard
            ref.read(authProvider.notifier).loginUser(user: user);
            // go to dashboard
            context.go(AppRoute.dashboard);
          } else {
            // Redirect to login
            context.go(AppRoute.login);
          }
        });
      } else {
        context.go(AppRoute.welcome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.dark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: AppTheme.light),
              child: Center(
                child: Image.asset(
                  "assets/icons/logo.png",
                  fit: BoxFit.fitWidth,
                  width: 120,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "MEST",
                style: AppFont.title.copyWith(
                    fontSize: 18,
                    color: AppTheme.light,
                    fontFamily: "monospace"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
