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
      style: const TextStyle(
        color: Color(0xFF519086),
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }
}
