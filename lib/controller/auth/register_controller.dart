import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/auth/auth.dart';
import '../../widgets/snak_bar.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _userLoginServies = UserLoginServies();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  //TextEditingController phoneController = TextEditingController();

  void isValid() {
    if (formKey.currentState!.validate()) {
      registerUser();
    } else {
      Get.snackbar('Error', 'Please fill in the required fields');
    }
  }

  RxString selectGender = "1".obs;
  void selectGenderFunc(String value) {
    selectGender.value = value;
  }

  Future<void> registerUser() async {
    Get.defaultDialog(
        title: "wait".tr,
        content: const CircularProgressIndicator(),
        barrierDismissible: false);
    try {
      if (passwordController.text == confirmPasswordController.text) {
        final response = await _userLoginServies.register({
          "userLoginType": 0,
          "firstname": firstname.text,
          "lastname": lastname.text,
          "email": emailController.text,
          "gender": int.parse(selectGender.value),
          "password": passwordController.text,
          "deviceType": Platform.operatingSystem
        });
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          /*  firstname.clear();
          lastname.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear(); */
          Get.back(); //İlk önce dialog kapatılır
          _logException(data['message'], color: Colors.green);
          Get.offAllNamed('/loginPage');
        } else {
          Get.back(); //İlk önce dialog kapatılır
          _logException(data['message'], color: Colors.red);
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
    ShowSnackMessage.showSnack(Get.context!,
        message: message, color: color ?? Colors.red);
  }
}
