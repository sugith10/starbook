import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obsecureText;
  final bool showSuffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final int fadeInDelay;
  final int fadeInDuration;

  const AuthTextField({
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.keyboardType,
    required this.showSuffixIcon,
    this.fadeInDelay = 0,
    this.fadeInDuration = 0,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    super.key,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late bool _obsecureText;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    return FadeInDown(
      delay: Duration(milliseconds: widget.fadeInDelay),
      duration: Duration(milliseconds: widget.fadeInDuration),
      child: TextFormField(
        // cursorColor: AppDarkColor.instance.pure,
        // cursorErrorColor: AppDarkColor.instance.pure,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _obsecureText,
        keyboardType: widget.keyboardType,
        focusNode: widget.focusNode,
        textInputAction: TextInputAction.next,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: widget.showSuffixIcon
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obsecureText = !_obsecureText;
                    });
                  },
                  icon: Icon(
                    _obsecureText
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                )
              : null,
          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                )
              : null,
          hintText: widget.hintText,
          errorText: widget.errorMsg,
          errorStyle: Theme.of(context).textTheme.labelSmall,
        ),
      ),
    );
  }
}
