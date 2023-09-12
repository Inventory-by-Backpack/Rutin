import 'package:get/route_manager.dart';
import 'package:inventory/src/screen/login/register.dart';

import '../../src/screen/home/home_screen.dart';
import '../../src/screen/home/inventory_detail.dart';
import '../../src/screen/login/forgot_pass.dart';
import '../../src/screen/login/login.dart';
import '../../src/screen/network/network_screen.dart';
import '../../src/screen/splash/splash_page.dart';

class RouteManagement {
  static const String initialRoute = '/splash';
  static List<GetPage> routeList = appRoute();
}

appRoute() => [
      GetPage(
          name: '/splash',
          page: () => const SplashPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/loginPage',
          page: () => const Login(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/registerPage',
          page: () => const Register(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/homePage',
          page: () => const HomePage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/forgotPasswordPage',
          page: () => const ForgotPasswordPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/networkErrorPage',
          page: () => const NetworkErrorPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/inventoryDetailPage',
          page: () => const InventoryDetail(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 500)),
    ];
