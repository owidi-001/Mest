import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/shared/common/widgets/form_field.dart';
import 'package:mest/shared/core/services/auth/register_service.dart';
import 'package:mest/shared/routes/routes.dart';
import 'package:mest/theme/font.dart';
import 'package:mest/theme/theme.dart';
import 'package:mest/shared/common/utils/utils.dart';
import 'package:mest/shared/common/widgets/app_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey _formKey = GlobalKey();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  _register() async {
    // validate data

    // TODO:
    RegisterRequest request = RegisterRequest(
      name: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
    );

    RegisterService().register(request).then((value) {
      // Do something
      context.go(AppRoute.dashboard);
    }).onError((error, stackTrace) {
      // Handle error
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppTheme.dark,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: PADDING),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: PADDING,
                  ),
                  const Spacer(flex: 3),
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
                    "Welcome",
                    style: AppFont.title.copyWith(color: Colors.white54),
                  ),
                  const SizedBox(
                    height: PADDING / 2,
                  ),
                  Text(
                    "Let's give you an identity...",
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
                    controller: _nameController,
                    decoration: buildInputDecoration("Nick name", "whoami"),
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
                    controller: _phoneController,
                    decoration: buildInputDecoration(
                      "Phone number",
                      "0700 000 000",
                    ),
                  ),
                  const SizedBox(
                    height: PADDING / 2,
                  ),
                  const SizedBox(
                    height: PADDING,
                  ),
                  AppButton(
                    title: "Sign up",
                    onTap: () {
                      // Invoke register
                      _register();
                    },
                    background: Colors.blueGrey,
                  ),
                  const SizedBox(
                    height: PADDING,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              style: AppFont.normal
                                  .copyWith(color: Colors.blueGrey),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.go(AppRoute.login),
                                text: " Login",
                                style: AppFont.normal
                                    .copyWith(color: Colors.white))
                          ])),
                    ],
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
