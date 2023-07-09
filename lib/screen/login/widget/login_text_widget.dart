import 'package:flutter/material.dart';

class AuthTextWidget extends StatelessWidget {
  const AuthTextWidget({
    required this.text,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 16,
          fontFamily: 'Poppins',
          fontWeight: fontWeight ?? FontWeight.w600),
    );
  }
}
