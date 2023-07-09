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
            minimumSize: const Size(double.infinity, 48)),
        onPressed: onPressed,
        child: Text(
          string,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
