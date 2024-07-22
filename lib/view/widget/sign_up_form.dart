import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sign_text_field.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  final TextEditingController userNameController;
  final String? errorMsg;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;
  const SignUpForm({
    super.key,
    required this.emailValidator,
    required this.passwordValidator,
    required this.passwordConfirmController,
    required this.emailController,
    required this.passwordController,
    required this.userNameController,
    this.errorMsg,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AuthTextField(
            fadeInDelay: 750,
            fadeInDuration: 850,
            controller: userNameController,
            hintText: "Name",
            obsecureText: false,
            showSuffixIcon: false,
            errorMsg: errorMsg,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.mail_outline_rounded,
            validator: emailValidator,
          ),
          SizedBox(height: 20.h),
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
          SizedBox(height: 20.h),
          AuthTextField(
            fadeInDelay: 650,
            fadeInDuration: 750,
            controller: passwordConfirmController,
            hintText: "Confirm Password",
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
