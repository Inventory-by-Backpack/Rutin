import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackMessage {
  static void showSnack({required String message, Color? color}) {
    Get.showSnackbar(
      GetSnackBar(
          message: message,
          backgroundColor: color ?? Colors.red,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(10),
          borderRadius: 10),
    );
  }
}
