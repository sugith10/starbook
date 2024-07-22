
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Widget child;
  final VoidCallback callback;
  const SubmitButton({
    required this.child,
    required this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         child ,
        ],
      ),
    );
  }
}