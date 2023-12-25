import 'package:get/route_manager.dart';
import 'package:inventory/src/screen/home/profile.dart';
import 'package:inventory/src/screen/welcome/register/all_page_selections/on_borading_page.dart';

import '../../src/screen/home/add_rutin.dart';
import '../../src/screen/home/inventory_detail.dart';
import '../../src/screen/home/plan_scereen.dart';
import '../../src/screen/welcome/forgot_pass.dart';
import '../../src/screen/welcome/login/login.dart';
import '../../src/screen/network/network_screen.dart';
import '../../src/screen/splash/splash_page.dart';
import '../../src/screen/welcome/register/register.dart';
import '../../src/screen/welcome/welcome_page.dart';
import '../../src/widgets/nav_bar/bottom_nav_bar.dart';

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
          page: () => const RegisterPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/onBoardingPage',
          page: () => const OnBoardingPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/homePage',
          page: () => const BottomNavBar(),
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
      GetPage(
          name: '/addRutinPage',
          page: () => const AddRutinPage(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/planScreen',
          page: () => const PlanScreen(),
          transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
          name: '/profilePage',
          page: () => const ProfilePage(),
          transitionDuration: const Duration(milliseconds: 500)),
    ];
