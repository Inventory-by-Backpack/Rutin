import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:inventory/screen/login/register.dart';

import '../screen/home/home_screen.dart';
import '../screen/login/forgot_pass.dart';
import '../screen/login/login.dart';
import '../screen/network/network_screen.dart';

class RouteManagement {
  static const String initialRoute = '/splash';
  static List<GetPage> routeList = appRoute();
}

appRoute() => [
      GetPage(
        name: '/splash',
        page: () => Container(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/loginPage',
        page: () => const Login(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/registerPage',
        page: () => const Register(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/homePage',
        page: () => const HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/forgotPasswordPage',
        page: () => const ForgotPasswordPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/networkErrorPage',
        page: () => const NetworkErrorPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];
