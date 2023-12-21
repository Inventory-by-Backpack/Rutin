import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFormField extends StatelessWidget {
  final String? hintText;
  final TextInputType? inputType;
  final bool privacy;

  const MyTextFormField({
    super.key,
    this.hintText,
    this.inputType,
    this.privacy = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x3F519087)),
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ), // Remove shadows from Container
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          hintText: hintText,
          hintStyle:
              GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        keyboardType: inputType,
        obscureText: privacy,
      ),
    );
  }
}
