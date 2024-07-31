import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';


import '../../core/route/route_name.dart';

import '../util/assets/asset_png.dart';

import '../widget/submit_button.dart';
import '../widget/terms_and_conditions_widget.dart';


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
            Hero(
              tag: "welcome",
              child: Image.asset(AssetPng.welcome)),
            const Spacer(flex: 4),
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
