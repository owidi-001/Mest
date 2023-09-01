import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/shared/core/services/auth/login_service.dart';
import 'package:mest/shared/routes/routes.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/shared/common/widgets/app_button.dart';
import 'package:mest/shared/common/widgets/form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passWordController.dispose();
    super.dispose();
  }

  _loginUser() async {
    // Call user login service
    LoginRequest request = LoginRequest(
        email: _emailController.text.trim(),
        password: _passWordController.text);
    LoginService().login(request).then((value) {
      // Do something
    }).onError((error, stackTrace) {
      // Do something
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppTheme.dark,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: PADDING * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: PADDING,
                ),
                Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset("assets/icons/logo.png"),
                ),
                const SizedBox(
                  height: PADDING * 2,
                ),
                Text(
                  "Welcome back",
                  style: AppFont.title.copyWith(color: Colors.white54),
                ),
                const SizedBox(
                  height: PADDING / 2,
                ),
                Text(
                  "Let's get you going...",
                  style: AppFont.normal.copyWith(color: Colors.white54),
                ),
                const SizedBox(
                  height: PADDING * 2,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  decoration:
                      buildInputDecoration("Phone number", "0700 000 000"),
                ),
                const SizedBox(
                  height: PADDING,
                ),
                AppButton(
                  title: "Sign in",
                  onTap: () {
                    // log in
                    context.go(AppRoute.dashboard);
                  },
                  background: Colors.blueGrey,
                ),
                const SizedBox(
                  height: PADDING,
                ),
                const SizedBox(
                  height: PADDING,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Don't have an account? ",
                            style:
                                AppFont.normal.copyWith(color: Colors.blueGrey),
                            children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => context.go(AppRoute.register),
                              text: " Register",
                              style:
                                  AppFont.normal.copyWith(color: Colors.white))
                        ])),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
