import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mest/core/services/auth/register_service.dart';
import 'package:mest/routes/routes.dart';
import 'package:mest/common/theme/font.dart';
import 'package:mest/common/theme/theme.dart';
import 'package:mest/common/utils/utils.dart';
import 'package:mest/common/widgets/app_button.dart';
import 'package:mest/common/widgets/form_field.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey _formKey = GlobalKey();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passWordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  _register() async {
    // validate data

    // TODO: 
    RegisterRequest request = RegisterRequest(
        name: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passWordController.text);

    RegisterService().register(request).then((value) {
      // Do something
      context.go(AppRoute.dashboard);
    }).onError((error, stackTrace) {
      // Handle error
    });
  }

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
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: PADDING * 2),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: PADDING,
                    ),
                    Text(
                      "Hola",
                      style: AppFont.title.copyWith(color: Colors.white54),
                    ),
                    const SizedBox(
                      height: PADDING / 2,
                    ),
                    Text(
                      "Please sign up to continue",
                      style: AppFont.normal.copyWith(color: Colors.white54),
                    ),
                    const SizedBox(
                      height: PADDING,
                    ),
                    const CircleAvatar(
                      radius: PADDING * 2,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.person_2),
                    ),
                    const SizedBox(
                      height: PADDING,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      controller: _nameController,
                      decoration: buildInputDecoration("Name", "john doe"),
                    ),
                    const SizedBox(
                      height: PADDING / 2,
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
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: _phoneController,
                      decoration:
                          buildInputDecoration("Phone", "+254 xxxx xxx xxx"),
                    ),
                    const SizedBox(
                      height: PADDING / 2,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      controller: _passWordController,
                      decoration: buildInputDecoration("Password", "password"),
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
                      controller: _confirmPasswordController,
                      decoration: buildInputDecoration(
                          "Password confirm", "confirm password"),
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
                        Text(
                          "or",
                          textAlign: TextAlign.center,
                          style:
                              AppFont.normal.copyWith(color: Colors.blueGrey),
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
                                text: "Already have an account? ",
                                style: AppFont.normal
                                    .copyWith(color: Colors.blueGrey),
                                children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () => {context.go(AppRoute.login)},
                                  text: " Login",
                                  style: AppFont.normal
                                      .copyWith(color: Colors.white))
                            ])),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
