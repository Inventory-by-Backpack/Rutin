import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;
  final String? Function(String?)? howValidate;

  final bool privacy;
  final Widget? suffixIcon;

  const MyTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.inputType,
    this.howValidate,
    this.privacy = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0x3F519087)),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(5),
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
            suffixIcon: suffixIcon,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none),
        keyboardType: inputType,
        validator: howValidate,
        obscureText: privacy,
      ),
    );
  }
}
