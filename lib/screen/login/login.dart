import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controller/auth/login_controller.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/padding/padding_widget.dart';
import '../../widgets/text_form.dart';
import 'widget/login_text_widget.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: SafeArea(
        child: MyPaddingWidget(
          child: Center(
            child: Form(
              key: loginController.formKey,
              child: Column(children: [
                const SizedBox(height: 30),
                Expanded(
                  child: Text(
                    'login'.tr,
                    style: const TextStyle(
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
                        AuthTextWidget(text: 'email'.tr),
                        const SizedBox(height: 10),
                        MyTextFormField(
                            controller: loginController.emailController,
                            hintText: 'user@gmail.com',
                            inputType: TextInputType.emailAddress,
                            howValidate: (value) =>
                                loginController.formValidate(value),
                            privacy: false),
                        AuthTextWidget(text: 'password'.tr),
                        const SizedBox(height: 10),
                        MyTextFormField(
                            controller: loginController.passwordController,
                            hintText: '*****',
                            inputType: TextInputType.visiblePassword,
                            howValidate: (value) =>
                                loginController.formValidate(value),
                            privacy: true),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/forgotPasswordPage');
                          },
                          child: AuthTextWidget(
                              text: 'forgot_password'.tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        MyElevatedButton(
                            string: 'login'.tr,
                            onPressed: () {
                              loginController.checkLogin();
                            }),
                        TextButton(
                          onPressed: () => Get.toNamed('/registerPage'),
                          child: AuthTextWidget(
                              text: 'dont_have_an_account'.tr,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
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
      errorStyle: const TextStyle(
        fontSize: 12,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      contentPadding: const EdgeInsets.all(10),
      border: InputBorder.none,
      hintText: hintText,
      hintStyle: const TextStyle(
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
