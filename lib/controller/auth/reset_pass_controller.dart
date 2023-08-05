import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/auth/auth.dart';
import '../../widgets/snak_bar.dart';

class ResetPasswordController {
  final _userLoginServies = UserLoginServies();
  final emailController = TextEditingController();

  Future<void> resetPassword() async {
    Get.defaultDialog(
      title: "loading".tr,
      content: const CircularProgressIndicator(),
      barrierDismissible: false,
    );
    try {
      await _userLoginServies.userResetPassword({
        "email": emailController.text,
      }).then((value) async {
        final data = jsonDecode(value.body);
        if (value.statusCode == 200) {
          if (data['isSuccess'] == true) {
            Get.close(1);
            _logException(data['message'], color: Colors.green);
          } else {
            Get.close(1);
            _logException(data['message'], color: Colors.red);
          }
        } else if (value.statusCode == 400) {
          Get.close(1);
          //Bad request
          _logException(data['message'], color: Colors.red);
        } else {
          Get.close(1);

          _logException(data['message'], color: Colors.red);
        }
      });
    } catch (e) {
      Get.close(1);
      _logException(e.toString(), color: Colors.red);
    }
  }

  void _logException(String message, {Color? color}) {
    ShowSnackMessage.showSnack(Get.context!,
        message: message, color: color ?? Colors.red);
  }
}
