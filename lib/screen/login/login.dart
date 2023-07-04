import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
            child: Form(
              key: loginController.formKey,
              child: Column(children: [
                SizedBox(height: 30),
                Expanded(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF484848),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'email',
                        style: TextStyle(
                          color: Color(0xFF484848),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                          controller: loginController.emailController,
                          hintText: 'user@gmail.com',
                          inputType: TextInputType.emailAddress,
                          howValidate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          privacy: false),
                      Text(
                        'password',
                        style: TextStyle(
                          color: Color(0xFF484848),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      MyTextFormField(
                          controller: loginController.passwordController,
                          hintText: '*****',
                          inputType: TextInputType.visiblePassword,
                          howValidate: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          privacy: true),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/forgotPasswordPage');
                        },
                        child: Text('forgot password?',
                            style: TextStyle(
                              color: Color(0xFF686868),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      MyElevatedButton(
                          string: 'Login',
                          onPressed: () {
                            loginController.checkLogin();
                          }),
                      TextButton(
                        onPressed: () => Get.toNamed('/registerPage'),
                        child: Text(
                          'don’t have an account?',
                          style: TextStyle(
                              color: Color(0xFF686868),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      /* MyElevatedButton(
                          string: 'continue with apple', onPressed: () {}),
                      SizedBox(height: 10),
                      MyElevatedButton(
                          string: 'continue with google', onPressed: () {}),
                      SizedBox(height: 10),
                      MyElevatedButton(
                          string: 'continue with microsoft', onPressed: () {}) */
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration formDecoration({required String hintText}) {
    return InputDecoration(
      errorStyle: TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(10),
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: TextStyle(
        color: Color(0xFF686868),
        fontSize: 14,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    );
  }

  buildTextForm({
    TextEditingController? controller,
    String? hintText,
    required TextInputType inputType,
    required String? Function(String?)? howValidate,
    required bool privacy,
  }) {
    return;
  }
}
