import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_book/view/widget/welcome_page_text.dart';

import '../util/message_generator.dart';
import '../widget/navigation_text.dart';

class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: [
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(Icons.arrow_back),
                      )),
                  onTap: (){}
                ),
                SizedBox(height: 20.h),
                WelcomeText(
                  text: MessageGenerator.getMessage("verification-welcome"),
                ),
                SizedBox(height: 5.h),
                WelcomeMsgText(
                  text: MessageGenerator.getMessage("verification-guide"),
                ),
                const WelcomeMsgText(text: "7907603014"),
                SizedBox(height: 30.h),
                const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.numbers_sharp,
                        color: Colors.grey,
                      ),
                      hintText: "Enter OTP"),
                ),
                SizedBox(height: 15.h),
                // SubmitButton(
                //   callback: () {},
                //   text: "Verify OTP",
                // ),
                SizedBox(height: 30.h),
                NavigationText(
                  leadingText: "Didn't receive the code?",
                  buttonText: "Resend Code",
                  buttonCall: () {},
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
