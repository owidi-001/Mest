import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/common/theme/font.dart';
import 'package:mest/common/theme/theme.dart';
import 'package:mest/common/utils/utils.dart';
import 'package:mest/common/widgets/app_button.dart';
import 'package:mest/common/widgets/form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: AppTheme.dark,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: PADDING * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: PADDING,
                ),
                Text(
                  "Welcome back",
                  style: AppFont.title.copyWith(color: Colors.white54),
                ),
                const SizedBox(
                  height: PADDING / 2,
                ),
                Text(
                  "Please sign in to continue",
                  style: AppFont.normal.copyWith(color: Colors.white54),
                ),
                const SizedBox(
                  height: PADDING,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  decoration:
                      buildInputDecoration("Email", "email@example.com"),
                ),
                const SizedBox(
                  height: PADDING / 2,
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.go,
                  controller: _passWordController,
                  decoration: buildInputDecoration(
                    "Password",
                    "password",
                  ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "or",
                      textAlign: TextAlign.center,
                      style: AppFont.normal.copyWith(color: Colors.blueGrey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: PADDING,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      child: Icon(Icons.face),
                    ),
                  ],
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
                                ..onTap = () => {context.go(AppRoute.register)},
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
