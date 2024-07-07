import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:star_book/view/route/route_name.dart';

import '../util/assets/asset_png.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2),
        () => Get.offNamedUntil(RouteName.welcome, (route) => route.isFirst));
    return Scaffold(
      body: Column(
        children: [
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Hero(
              tag: "welcomeLogo",
              child: Image.asset(AssetPng.welcomeLogo)),
          ),
          const Spacer(flex: 1)
        ],
      ),
    );
  }
}
