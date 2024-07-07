import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:star_book/view/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';

import 'core/di/app_binding.dart';
import 'view/route/app_route.dart';
import 'view/route/route_name.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      minTextAdapt: false,
      fontSizeResolver: FontSizeResolvers.radius,
      builder: (context, child) {
        return GetMaterialApp(
          title: "Starbook",
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          darkTheme: appTheme,
          initialRoute: RouteName.initial,
          getPages: AppRoute.routes,
          initialBinding: AppBinding(),
        );
      },
    );
  }

  static void debugPrint(Object? object) {
    if (kDebugMode) {
      print(object);
    }
  }
}
