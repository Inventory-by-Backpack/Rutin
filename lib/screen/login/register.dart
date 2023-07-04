import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/register_controller.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_form.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Center(
              child: Form(
                  key: _.formKey,
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
                              controller: _.firstname,
                              hintText: 'Alexis',
                              inputType: TextInputType.name,
                              howValidate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              privacy: false),
                          basliklar('Last name'),
                          SizedBox(height: 10),
                          MyTextFormField(
                              controller: _.lastname,
                              hintText: 'CROWN',
                              inputType: TextInputType.name,
                              howValidate: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                              privacy: false),
                          basliklar('email'),
                          Obx(() => Card(
                                child: DropdownButtonFormField(
                                    value: _.selectGender.value,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: Get.width * .02),
                                      enabledBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                          child: Text('Male'), value: "1"),
                                      DropdownMenuItem(
                                          child: Text('Female'), value: "2"),
                                    ],
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    onChanged: (v) {
                                      _.selectGenderFunc(v.toString());
                                    }),
                              )),
                          basliklar('Gender'),
                          MyTextFormField(
                              controller: _.emailController,
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
                          MyTextFormField(
                              controller: _.passwordController,
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
                              controller: _.confirmPasswordController,
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
                              onPressed: () => _.isValid(), string: 'register'),
                        ],
                      )),
                    ],
                  ))),
        ),
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
