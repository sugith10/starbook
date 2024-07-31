import 'package:get/get.dart';
import 'package:star_book/view/page/sign_up_page.dart';

import '../../view/page/main_page.dart';
import '../../view/page/sign_in_page.dart';
import '../../view/page/splash_page.dart';
import '../../view/page/welcome_page.dart';
import 'route_name.dart';

class AppRoute {
  AppRoute._();

  static final routes = [
    GetPage(
      name: RouteName.initial,
      page: () => const SplashPage(),
      transition: Transition.native,
    ),
    GetPage(
      name: RouteName.welcome,
      page: () => const WelcomePage(),
      transition: Transition.native,
    ),
    GetPage(
      name: RouteName.signIn,
      page: () => const SignInPage(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RouteName.signUp,
      page: () => const SignUpPage(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: RouteName.home,
      page: () => const MainPage(),
      transition: Transition.native,
    ),
  ];
}
