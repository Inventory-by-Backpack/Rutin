import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/env/static_data.dart';

class GeneralSystemController extends GetxController {
  SharedPreferences? _prefs;

  final _isDarkMode = false.obs;
  bool get isDarkMode => _isDarkMode.value;
  final _languageCode = 'en'.obs;
  String get languageCode => _languageCode.value;

  bool isPrefLoading = false;

  @override
  void onInit() {
    super.onInit();
    _init();
  }

  _init() async {
    try {
      isPrefLoading = true;
      _prefs = await SharedPreferences.getInstance();
    } catch (e) {
      await _prefs?.remove(Strings.token);
      await _prefs?.remove(Strings.refreshToken);
      throw Exception(e);
    } finally {
      isPrefLoading = false;
      update();
    }
  }

  String? get refreshToken => _prefs?.getString('refreshToken');
  String? get token => _prefs?.getString('token');
  String? get userId => _prefs?.getString('userUid');
  String get email => _prefs?.getString('email') ?? '';

  set refreshToken(String? value) {
    if (value != null) {
      _prefs?.setString('refreshToken', value);
      update();
    } else {
      _prefs?.remove(Strings.refreshToken);
      update();
    }
  }

  set token(String? value) {
    if (value != null) {
      _prefs?.setString('token', value);
      update();
    } else {
      _prefs?.remove(Strings.token);
      update();
    }
  }

  set userUid(String? value) {
    if (value != null) {
      _prefs?.setString('userUid', value);
      update();
    } else {
      _prefs?.remove(Strings.userUID);
      update();
    }
  }

  set email(String? value) {
    if (value != null) {
      _prefs?.setString('email', value);
      update();
    } else {
      _prefs?.remove(Strings.email);
      update();
    }
  }

  void changeTheme() {
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    _isDarkMode.toggle();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('theme', _isDarkMode.value);
    });
  }

  void changeLanguage() {
    _languageCode.value = _languageCode.value == 'en-US' ? 'tr-TR' : 'en-US';
    Get.updateLocale(Locale(_languageCode.value));
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('language', languageCode);
    });
  }

  void userLogout() {
    token = null;
    refreshToken = null;
    userUid = null;
    email = null;

    Get.offAllNamed('/loginPage');
    update();
  }
}
