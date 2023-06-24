import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';

class RegisterFigma extends StatelessWidget {
  const RegisterFigma({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: SizedBox(
          width: 393,
          height: 852,
          child: Form(
            key: loginController.loginFormKey,
            child: Stack(
              children: [
                Positioned(
                  left: 172,
                  top: 296,
                  child: Text(
                    'email',
                    style: TextStyle(
                      color: Color(0xFF484848),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 155,
                  top: 375,
                  child: Text(
                    'password',
                    style: TextStyle(
                      color: Color(0xFF484848),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Positioned(
                  left: 134,
                  top: 454,
                  child: Text(
                    'forgot password?',
                    style: TextStyle(
                      color: Color(0xFF686868),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Positioned(
                  left: 112,
                  top: 532,
                  child: TextButton(
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
                ),
                Positioned(
                    left: 47,
                    top: 474,
                    child: buton(
                        string: 'Login',
                        onPressed: () {
                          loginController.checkLogin();
                        })),
                Positioned(
                  left: 47,
                  top: 396,
                  child: leyir(
                    TextFormField(
                      controller: loginController.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      decoration: formDecoration(hintText: '******'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 47,
                  top: 317,
                  child: leyir(
                    TextFormField(
                      controller: loginController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: formDecoration(hintText: 'user@mail.com'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Positioned(
                    left: 49,
                    top: 648,
                    child: buton(
                        string: 'continue with google', onPressed: () {})),
                Positioned(
                    left: 49,
                    top: 704,
                    child: buton(
                        string: 'continue with microsoft', onPressed: () {})),
                Positioned(
                    left: 49,
                    top: 592,
                    child:
                        buton(string: 'continue with apple', onPressed: () {})),
                Positioned(
                  left: 173,
                  top: 100,
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
              ],
            ),
          ),
        )),
      ),
    );
  }

  InputDecoration formDecoration({required String hintText}) {
    return InputDecoration(
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

  ElevatedButton buton(
      {required void Function()? onPressed, required String string}) {
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

  Container leyir(Widget? child) {
    return Container(
        width: 297,
        height: 48,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
            color: const Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: child);
  }
}
