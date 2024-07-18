import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import '../route/route_name.dart';
import '../util/assets/asset_png.dart';
import '../util/message_generator.dart';
import '../widget/submit_button.dart';
import '../widget/terms_and_conditions_widget.dart';
import '../widget/welcome_page_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _phoneNumCntrlr = TextEditingController();

  ProgressDialog? pr;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumCntrlr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Spacer(flex: 4),
            Center(
              child: SizedBox(
                height: 250,
                width: 250,
                child: Hero(
                  tag: "welcomeLogo",
                  child: Image.asset(AssetPng.welcomeLogo),
                ),
              ),
            ),
            const Spacer(flex: 4),
            WelcomeText(
              text: MessageGenerator.getMessage("auth-welcome"),
            ),
            SizedBox(height: 5.h),
            WelcomeMsgText(
              text: MessageGenerator.getMessage(
                "auth-welcome-message",
              ),
            ),
            const Spacer(flex: 2),
            Row(
              children: [
                Expanded(
                  child: SubmitButton(
                    callback: () {
                        Get.toNamed(RouteName.signUp);
                    },
                    text: "Sign Up",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SubmitButton(
                    callback: () {
                      Get.toNamed(RouteName.signIn);
                    },
                    text: "Login",
                  ),
                ),
              ],
            ),
            const Spacer(flex: 1),
            const TermsAndConditionsWidget(),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
