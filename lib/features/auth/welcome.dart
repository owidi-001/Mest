import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/shared/core/prefs/app_prefs.dart';
import 'package:mest/shared/routes/routes.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/shared/common/widgets/app_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), _initialize);
  }

  Future<void> _initialize() async {
    context.go(AppRoute.welcome);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.dark,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mest",
                    style: AppFont.title.copyWith(
                        fontFamily: "monospace", color: AppTheme.light),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(32),
                child: Image.asset("assets/illustrators/welcome.png"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome.",
                    style: AppFont.title.copyWith(color: AppTheme.light),
                  ),
                  const SizedBox(
                    height: PADDING,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: PADDING),
                    child: Text(
                      // "Plan, pick and save your daily meal plans.",
                      "We read because we can...",
                      style: AppFont.normal.copyWith(color: AppTheme.light),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: PADDING * 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(PADDING),
                    child: AppButton(
                      title: "Continue",
                      onTap: (() {
                        // confirm onboarded
                        AppPreferences()
                            .board()
                            .then((value) => {context.go(AppRoute.register)});
                      }),
                      background: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(
                    height: PADDING * 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
