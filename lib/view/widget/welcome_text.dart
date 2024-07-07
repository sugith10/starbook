import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'welcome_page_text.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String text;
  const WelcomeTextWidget({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: const Duration(milliseconds: 800),
      duration: const Duration(milliseconds: 900),
      child: WelcomeText(text: text),
    );
  }
}
