import 'package:flutter/material.dart';

import 'navigation_text.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          NavigationText(
            leadingText: "By proceeding, I accept Starbook",
            buttonText: 'T&C',
            buttonCall: () {
              // AppPolicyUtil().launchConditions();
            },
          ),
          NavigationText(
            leadingText: "and",
            buttonText: 'Privacy Policy.',
            buttonCall: () {
              // AppPolicyUtil().launchPrivacyPolicy();
            },
          ),
        ],
      ),
    );
  }
}
