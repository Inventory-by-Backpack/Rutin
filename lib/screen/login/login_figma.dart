import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/register_controller.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());

    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: SizedBox(
          width: 393,
          height: 852,
          child: Form(
            key: registerController.formKey,
            child: Stack(
              children: [
                Positioned(
                  left: 160,
                  top: 100,
                  child: Text(
                    'register',
                    style: TextStyle(
                      color: Color(0xFF484848),
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Positioned(left: 172, top: 368, child: basliklar('name')),
                Positioned(left: 173, top: 447, child: basliklar('email')),
                Positioned(left: 156, top: 526, child: basliklar('password')),
                Positioned(
                  left: 123,
                  top: 605,
                  child: basliklar('confirm password'),
                ),
                Positioned(
                  left: 48,
                  top: 547,
                  child: leyir(
                    TextFormField(
                      controller: registerController.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '*******',
                        hintStyle: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 626,
                  child: leyir(
                    TextFormField(
                      controller: registerController.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '*******',
                        hintStyle: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 389,
                  child: leyir(
                    TextFormField(
                      controller: registerController.nameController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Alexis CROWN',
                        hintStyle: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 49,
                  top: 704,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(297, 48),
                      backgroundColor: Color(0xFFEFEFEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (!registerController.formKey.currentState!
                          .validate()) {
                        registerController.registerUser();
                      } else {
                        print('validation failed');
                      }
                    },
                    child: Text(
                      'register',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF484848),
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 48,
                  top: 468,
                  child: leyir(
                    TextFormField(
                      controller: registerController.emailController,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'user@mail.com',
                        hintStyle: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 684,
                  child: Text(
                    'terms & conditions',
                    style: TextStyle(
                      color: Color(0xFF686868),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Text basliklar(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF484848),
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Container leyir(Widget? child) {
    return Container(
        width: 297,
        height: 48,
        padding: const EdgeInsets.all(10),
        decoration: ShapeDecoration(
            color: Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        child: child);
  }
}
