import 'package:get/route_manager.dart';
import 'package:inventory/src/screen/welcome/register/register.dart';

import '../../src/screen/home/home_screen.dart';
import '../../src/screen/home/inventory_detail.dart';
import '../../src/screen/welcome/forgot_pass.dart';
import '../../src/screen/welcome/login/login.dart';
import '../../src/screen/network/network_screen.dart';
import '../../src/screen/splash/splash_page.dart';
import '../../src/screen/welcome/welcome_page.dart';

class RouteManagement {
  static const String initialRoute = '/splash';
  static List<GetPage> routeList = appRoute();
}

appRoute() => [
      GetPage(
          name: '/splash',
          page: () => const SplashPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/welcomePage',
          page: () => const WelcomePage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/loginPage',
          page: () => const LoginPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/registerPage',
          page: () => const OnBoardingPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/homePage',
          page: () => const HomePage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/forgotPasswordPage',
          page: () => const ForgotPasswordPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/networkErrorPage',
          page: () => const NetworkErrorPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/inventoryDetailPage',
          page: () => const InventoryDetail(),
          transitionDuration: const Duration(milliseconds: 500)),
    ];
