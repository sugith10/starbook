import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import '../route/route_name.dart';
import '../util/assets/asset_png.dart';
import '../util/message_generator.dart';
import '../widget/submit_button.dart';
import '../widget/terms_and_conditions_widget.dart';
import '../widget/welcome_page_text.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

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
                    child: const Text("Sign Up"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SubmitButton(
                    callback: () {
                      Get.toNamed(RouteName.signIn);
                    },
                    child: const Text("Login"),
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
