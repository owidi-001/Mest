import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), _initialize);
  }

  Future<void> _initialize() async {
    context.go(AppRoute.welcome);
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
            CircleAvatar(
                backgroundColor: AppTheme.light,
                maxRadius: 50,
                child: Image.asset("assets/icons/Mest Logo.png")),
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
