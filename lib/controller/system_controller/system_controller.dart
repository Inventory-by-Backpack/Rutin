import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSystemController extends GetxController {
  final _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;

  void changeTheme() {
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    _isDarkMode.toggle();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('theme', _isDarkMode.value);
    });
  }
}
