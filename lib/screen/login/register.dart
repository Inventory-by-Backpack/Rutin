import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/register_controller.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());

    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Form(
                key: registerController.formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Expanded(
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
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        basliklar('name'),
                        SizedBox(height: 10),
                        MyTextFormField(
                            controller: registerController.nameController,
                            hintText: 'Alexis CROWN',
                            inputType: TextInputType.name,
                            howValidate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            privacy: false),
                        basliklar('email'),
                        SizedBox(height: 10),
                        MyTextFormField(
                            controller: registerController.emailController,
                            hintText: 'user@gmail.com',
                            inputType: TextInputType.emailAddress,
                            howValidate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            privacy: false),
                        basliklar('password'),
                        SizedBox(height: 10),
                        MyTextFormField(
                            controller: registerController.passwordController,
                            hintText: '*****',
                            inputType: TextInputType.visiblePassword,
                            howValidate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            privacy: true),
                        basliklar('confirm password'),
                        SizedBox(height: 10),
                        MyTextFormField(
                            controller:
                                registerController.confirmPasswordController,
                            hintText: '*****',
                            inputType: TextInputType.visiblePassword,
                            howValidate: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            privacy: true),
                        SizedBox(height: 10),
                        Text(
                          'terms & conditions',
                          style: TextStyle(
                            color: Color(0xFF686868),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        MyElevatedButton(
                            onPressed: () => registerController.isValid(),
                            string: 'register'),
                      ],
                    )),
                  ],
                ))),
      ),
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
}
