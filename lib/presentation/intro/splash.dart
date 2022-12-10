import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), _initialize);
  }

  Future<void> _initialize() async {
    context.go(AppRoute.home);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: Center(
          child: CircleAvatar(
            backgroundColor: AppTheme.gradient,
            radius: 48,
            child: ClipOval(
              child: Image.asset(
                "assets/icons/mest.png",
                scale: 4.0,
              ),
            ),
          ),
        ));
  }
}
