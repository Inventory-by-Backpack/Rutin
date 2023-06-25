import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String string;

  const MyElevatedButton({
    super.key,
    required this.onPressed,
    this.string = '',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEFEFEF),
          minimumSize: const Size(297, 48),
        ),
        onPressed: onPressed,
        child: Text(
          string,
          style: const TextStyle(
            color: Color(0xFF484848),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
