import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sign_text_field.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final String? errorMsg;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;
  const SignInForm(
      {super.key,
      required this. emailValidator,
      required this.passwordValidator,
      required this.emailController,
      required this.passwordController,
      this.errorMsg,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            fadeInDelay: 700,
            fadeInDuration: 800,
            controller: emailController,
            hintText: "Email",
            obsecureText: false,
            showSuffixIcon: false,
            errorMsg: errorMsg,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail_outline_rounded,
            validator: emailValidator,
          ),
          SizedBox(height: 20.h),
          AuthTextField(
            fadeInDelay: 650,
            fadeInDuration: 750,
            controller: passwordController,
            hintText: "Password",
            obsecureText: true,
            errorMsg: errorMsg,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icons.password_rounded,
            showSuffixIcon: true,
            validator: passwordValidator,
          ),
        ],
      ),
    );
  }
}
