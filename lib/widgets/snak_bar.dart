import 'package:flutter/material.dart';

class ShowSnackMessage {
  static void showSnack(BuildContext context,
      {required String message, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: color ?? Colors.red,
          content: Text(message),
          duration: const Duration(seconds: 2)),
    );
  }
}
