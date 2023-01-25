import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';
import 'package:mest/widgets/app_button.dart';

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
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: PADDING * 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Mest",
                        style: AppFont.title,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: PADDING * 4,
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: PADDING * 4, horizontal: PADDING),
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              color: AppTheme.gold,
              // image: DecorationImage(
              //     image: AssetImage("assets/illustrators/food.png"),
              //     fit: BoxFit.fitWidth),
            ),
            child: Column(
              children: const [
                Text(
                  "Mest",
                  style: TextStyle(
                      fontSize: PADDING * 2,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.dark,
                      fontFamily: "lato"),
                ),
                SizedBox(
                  height: PADDING,
                ),
                Image(image: AssetImage("assets/illustrators/food.png")),
              ],
            ),
          ),
          Positioned(
            bottom: PADDING,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome.",
                  style: AppFont.title,
                ),
                const SizedBox(
                  height: PADDING,
                ),
                const Text(
                  "Plan, pick and save your daily meal plans.",
                  style: AppFont.normal,
                ),
                const SizedBox(
                  height: PADDING * 5,
                ),
                AppButton(
                    title: "Continue",
                    onTap: (() {
                      context.go(AppRoute.home);
                    })),
                const SizedBox(
                  height: PADDING * 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
