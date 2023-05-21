import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../screen/home/home_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/login/register_scren.dart';

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
        page: () => const LoginScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),GetPage(
        name: '/registerPage',
        page: () => const RegisterPage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/homePage',
        page: () => const HomePage(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      
    ];
