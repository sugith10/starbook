import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

import '../../core/util/app_exception.dart';
import '../../view_model/auth_controller.dart';
import '../const/app_padding.dart';
import '../route/route_name.dart';
import '../widget/animated_navigation_button.dart';
import '../widget/auth_app_bar.dart';
import '../widget/sign_up_form.dart';
import '../widget/submit_button.dart';
import '../widget/terms_and_conditions_widget.dart';
import '../widget/welcome_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _errorMsg;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _formKey;
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _passwordConfirmController.dispose();
    super.dispose();
  }

  void _submitCredentials() {
    if (_formKey.currentState!.validate()) {
      authController.login(_emailController.text, _passwordController.text);
    } else {
      authController.error(const AppException(details: "Fill all fields"));
    }
  }

  final _emailVal = ValidationBuilder().email().maxLength(30).build();
  final _passwordVal =
      ValidationBuilder().minLength(5, 'Length < 5 😟').build();

  @override
  Widget build(BuildContext context) {
    // Listen for changes in the userModel and errorMessage
    ever(authController.userModel, (userModel) {
      if (userModel != null) {
        Get.offNamed(RouteName.home);
      }
    });

    ever(authController.errorMessage, (errorMessage) {
      if (errorMessage != null) {
        Get.snackbar(errorMessage.title, errorMessage.description);
      }
    });
    return Scaffold(
      appBar: const AuthAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.authPadding),
          child: Column(
            children: [
              const WelcomeTextWidget(
                text: "Welcome to Starbook",
              ),
              SizedBox(height: 35.h),
              SignUpForm(
                formKey: _formKey,
                errorMsg: _errorMsg,
                emailController: _emailController,
                passwordController: _passwordController,
                passwordConfirmController: _passwordConfirmController,
                emailValidator: _emailVal,
                passwordValidator: _passwordVal,
                userNameController: _userNameController,
              ),
              SizedBox(height: 15.h),
              SizedBox(height: 35.h),
              Align(
                alignment: Alignment.center,
                child: AnimatedNavigationText(
                  leadingText: 'Already have an account?',
                  buttonText: 'Login',
                  callback: () {},
                ),
              ),
              SizedBox(height: 25.h),
              FadeInUp(
                delay: const Duration(milliseconds: 800),
                duration: const Duration(milliseconds: 900),
                child: SubmitButton(
                  child: Obx(
                    () => authController.isLoading.value
                        ? const CupertinoActivityIndicator(radius: 10)
                        : const Text('LOG IN'),
                  ),
                  callback: () {
                    _submitCredentials();
                  },
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                delay: const Duration(milliseconds: 900),
                duration: const Duration(milliseconds: 1000),
                child: const TermsAndConditionsWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
