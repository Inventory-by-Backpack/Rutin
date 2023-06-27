import 'package:flutter/material.dart';

import '../../widgets/elevated_button.dart';
import '../../widgets/text_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Expanded(
                flex: 3,
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    color: Color(0xFF484848),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: Color(0xFF484848),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      MyTextFormField(
                        hintText: 'user@gmail.com',
                      ),
                      SizedBox(height: 20),
                      MyElevatedButton(
                        onPressed: () {},
                        string: 'Send Reset Link',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
