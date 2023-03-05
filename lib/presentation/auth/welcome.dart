import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/common/theme/font.dart';
import 'package:mest/common/theme/theme.dart';
import 'package:mest/common/utils/utils.dart';
import 'package:mest/common/widgets/app_button.dart';

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
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        decoration: const BoxDecoration(color: AppTheme.dark),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: PADDING * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Mest",
                        style: AppFont.title.copyWith(
                            fontFamily: "monospace", color: AppTheme.light),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: PADDING * 4,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 3,
                    child: Image.asset("assets/illustrators/welcome.png"),
                  ),
                  const SizedBox(
                    height: PADDING * 4,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  vertical: PADDING * 4, horizontal: PADDING),
              alignment: Alignment.topCenter,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
            ),
            Positioned(
              bottom: PADDING,
              left: 0,
              right: 0,
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
                        context.go(AppRoute.register);
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
