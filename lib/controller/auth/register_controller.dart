import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/rest_log.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _userLoginServies = UserLoginServies();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //TextEditingController phoneController = TextEditingController();

  void isValid() {
    if (formKey.currentState!.validate()) {
      registerUser();
    } else {
      Get.snackbar('Error', 'Please fill in the required fields');
    }
  }

  Future<void> registerUser() async {
    Get.defaultDialog(
      title: "Yükleniyor...",
      content: const CircularProgressIndicator(),
      barrierDismissible: false,
    );
    try {
      final SharedPreferences prefs = await _prefs;
      if (passwordController.text == confirmPasswordController.text) {
        final response = await _userLoginServies.postRegister({
          "name": nameController.text,
          "email": emailController.text.trim(),
          "password": passwordController.text,
        });
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['code'] == 0) {
            final token = data['data']['Token'];
            prefs.setString('token', token);
            nameController.clear();
            emailController.clear();
            passwordController.clear();
            confirmPasswordController.clear();
            Get.back(); //İlk önce dialog kapatılır
            Get.offAllNamed('/homePage');
          } else {
            Get.back();
            _logException(data['message'], color: Colors.red);
          }
        } else {
          Get.back(); //İlk önce dialog kapatılır
          _logException('${response.statusCode} Hata', color: Colors.red);
        }
      } else {
        Get.back();
        _logException('Password not mach', color: Colors.red);
      }
    } catch (e) {
      _logException(e.toString(), color: Colors.red);
    }
  }

  void _logException(String message, {Color? color}) {
    Get.showSnackbar(
      GetSnackBar(
          title: message,
          message: message,
          duration: const Duration(seconds: 1),
          backgroundColor: color ?? Colors.red),
    );
  }
}
