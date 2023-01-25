import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/presentation/auth/welcome.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/utils/utils.dart';
import 'package:mest/widgets/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

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

    // Future.delayed(const Duration(seconds: 5)).then((value) => setState(() {
    //       isLoaded = true;
    //     }));

    Future.delayed(const Duration(seconds: 6), _initialize);
  }

  Future<void> _initialize() async {
    if (kDebugMode) {
      print("Checking init method");
      print(isLoaded);
    }
    isLoaded ? context.go(AppRoute.home) : context.go(AppRoute.welcome);
    return;
  }

  @override
  Widget build(BuildContext context) {
    // check if is boarded
    bool isBoarded = true;

    var prefs = SharedPreferences.getInstance();
    prefs.then((value) => {isBoarded = value.getBool(BOARDED) ?? false});

    return SplashScreenView(
      duration: const Duration(seconds: 5),
      navigateWhere: isLoaded,
      navigateRoute:
          isBoarded ? const BottomNavigation() : const Welcome(),
      backgroundColor: Colors.white,
      // linearGradient: const LinearGradient(
      //     colors: [
      //       AppTheme.light,
      //       AppTheme.gold,
      //     ],
      // begin: FractionalOffset(0.0, 0.0),
      // end: FractionalOffset(1.0, 0.0),
      // stops: [0.0, 1.0],
      // tileMode: TileMode.clamp),
      text: WavyAnimatedText("Mest Planner", textStyle: AppFont.title),
      imageSrc: "assets/icons/mest.png",
      displayLoading: true,
    );
  }
}
