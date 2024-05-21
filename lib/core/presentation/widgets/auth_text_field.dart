import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets/asset_svg.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  const AuthTextField({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
  keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset(AssetSvg.india),
            const SizedBox(width: 10),
            Text(
              "+91",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(width: 10),
          ],
        ),
        hintText: "Enter your phone number",
      ),
    );
  }
}
