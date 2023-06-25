import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? inputType;
  final String? Function(String?)? howValidate;

  final bool privacy;

  const MyTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.inputType,
    this.howValidate,
    this.privacy = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 297,
      height: 48,
      decoration: ShapeDecoration(
        color: Color(0xFFEFEFEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: TextFormField(
        controller: controller,
        textAlign: TextAlign.center,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Color(0xFF686868),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500),
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
