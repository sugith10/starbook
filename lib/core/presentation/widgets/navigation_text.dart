import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String leadingText;
  final String buttonText;
  final VoidCallback buttonCall;

  const NavigationText({
    super.key,
    required this.leadingText,
    required this.buttonText,
    required this.buttonCall,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        buttonCall();
      },
      child: RichText(
        text: TextSpan(
          text: '$leadingText ',
          style: Theme.of(context).textTheme.labelSmall,
          children: [
            TextSpan(
              text: buttonText,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    decorationColor: const Color.fromARGB(255, 0, 0, 0),
                    decoration: TextDecoration.underline,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
