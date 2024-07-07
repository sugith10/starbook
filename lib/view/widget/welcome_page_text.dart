import 'package:flutter/material.dart';

class WelcomeMsgText extends StatelessWidget {
  final String text;
  const WelcomeMsgText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}

class WelcomeText extends StatelessWidget {
  final String text;
  const WelcomeText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge);
  }
}
