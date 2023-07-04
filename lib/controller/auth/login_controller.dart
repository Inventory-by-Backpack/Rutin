import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/widgets/snak_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:shared_preferences/shared_preferences.dart';
import '../../model/auth/login_model.dart';
import '../../service/auth/auth.dart';

class LoginController extends GetxController {
  final _userLoginServies = UserLoginServies();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final LoginModel loginModel = LoginModel();

  void checkLogin() async {
    if (formKey.currentState!.validate()) {
      await loginSwagger();
    } else {
      Get.snackbar('Error', 'Please fill in the required fields');
    }
  }

  Future<void> loginSwagger() async {
    Get.defaultDialog(
      title: "Yükleniyor...",
      content: const CircularProgressIndicator(),
      barrierDismissible: false,
    );
    try {
      await _userLoginServies.login({
        "username": emailController.text,
        "password": passwordController.text
      }).then((value) async {
        final data = jsonDecode(value.body);
        if (value.statusCode == 200) {
          if (data['isSuccess'] == true) {
            Get.back();
            _logException('Giriş Başarılı', color: Colors.green);
            loginModelFromJson(value.body);
            final SharedPreferences prefs = await _prefs;
            prefs.setString('token', data['data']['accessToken']);
            Get.offAllNamed('/homePage');
          } else {
            Get.back();
            _logException(data['message'], color: Colors.red);
          }
        } else if (value.statusCode == 400) {
          //Buraya ayrı bir yer gelecek
          Get.back();
          _logException(value.body, color: Colors.red);
        } else {
          Get.back();
          _logException(data['message'], color: Colors.red);
        }
      });
    } catch (e) {
      Get.back();
      _logException(e.toString(), color: Colors.red);
    }
  }

  void _logException(String message, {Color? color}) {
    ShowSnackMessage.showSnack(Get.context!,
        message: message, color: color ?? Colors.red);
  }
}
