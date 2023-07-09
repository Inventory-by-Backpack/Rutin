import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/register_controller.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/padding/padding_widget.dart';
import '../../widgets/text_form.dart';
import 'widget/login_text_widget.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(RegisterController());
    return Scaffold(
      body: SafeArea(
        child: MyPaddingWidget(
          child: Center(
              child: Form(
                  key: _.formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Expanded(
                        child: Text(
                          'register'.tr,
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                AuthTextWidget(text: 'name'.tr),
                                MyTextFormField(
                                    controller: _.firstname,
                                    hintText: 'Alexis',
                                    inputType: TextInputType.name,
                                    howValidate: (value) =>
                                        _.formValidate(value),
                                    privacy: false),
                                AuthTextWidget(text: 'last_name'.tr),
                                MyTextFormField(
                                    controller: _.lastname,
                                    hintText: 'CROWN',
                                    inputType: TextInputType.name,
                                    howValidate: (value) =>
                                        _.formValidate(value),
                                    privacy: false),
                                AuthTextWidget(text: 'gender'.tr),
                                Card(
                                  child: DropdownButtonFormField(
                                      value: _.selectGender?.value,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: Get.width * .02),
                                        enabledBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      hint: Text('gender'.tr),
                                      items: [
                                        DropdownMenuItem(
                                            value: "1", child: Text('male'.tr)),
                                        DropdownMenuItem(
                                            value: "2",
                                            child: Text('female'.tr)),
                                      ],
                                      validator: (value) {
                                        if (value == null) {
                                          return 'please_enter_some_text'.tr;
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (v) {
                                        _.selectGenderFunc(v);
                                      }),
                                ),
                                AuthTextWidget(text: 'email'.tr),
                                MyTextFormField(
                                    controller: _.emailController,
                                    hintText: 'user@gmail.com',
                                    inputType: TextInputType.emailAddress,
                                    howValidate: (value) =>
                                        _.formValidate(value),
                                    privacy: false),
                                AuthTextWidget(text: 'password'.tr),
                                MyTextFormField(
                                    controller: _.passwordController,
                                    hintText: '*****',
                                    inputType: TextInputType.visiblePassword,
                                    howValidate: (value) =>
                                        _.formValidate(value),
                                    privacy: true),
                                AuthTextWidget(text: 'confirm_password'.tr),
                                MyTextFormField(
                                    controller: _.confirmPasswordController,
                                    hintText: '*****',
                                    inputType: TextInputType.visiblePassword,
                                    howValidate: (value) =>
                                        _.formValidate(value),
                                    privacy: true),
                                Text(
                                  'terms_conditions'.tr,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                MyElevatedButton(
                                    onPressed: () => _.isValid(),
                                    string: 'register'.tr),
                              ],
                            )),
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }
}
