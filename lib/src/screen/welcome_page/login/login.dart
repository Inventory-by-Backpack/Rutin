import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../widgets/app_background.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/elevated_button.dart';
import '../../../widgets/padding/padding_widget.dart';
import '../../../widgets/text_form.dart';
import 'widget/login_text_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: 'Login'),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Obx(
            () => MyElevatedButton(
              string: loginController.isLoading.value == false
                  ? 'Login'
                  : 'Loading',
              onPressed: loginController.isLoading.value == false
                  ? () {
                      loginController.checkLogin();
                    }
                  : null,
            ),
          ),
        ),
        body: SafeArea(
          child: MyPaddingWidget(
            child: Center(
              child: Form(
                key: loginController.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AuthTextWidget(text: 'email'.tr),
                      const SizedBox(height: 15),
                      MyTextFormField(
                          controller: loginController.emailController,
                          hintText: 'user@gmail.com',
                          inputType: TextInputType.emailAddress,
                          howValidate: (value) =>
                              loginController.formValidate(value),
                          privacy: false),
                      const SizedBox(height: 15),
                      AuthTextWidget(text: 'password'.tr),
                      const SizedBox(height: 15),
                      MyTextFormField(
                          controller: loginController.passwordController,
                          hintText: '*****',
                          inputType: TextInputType.visiblePassword,
                          howValidate: (value) =>
                              loginController.formValidate(value),
                          privacy: loginController.isPasswordVisible.value),
                      TextButton.icon(
                        onPressed: () {
                          Get.toNamed('/forgotPasswordPage');
                        },
                        label: AuthTextWidget(
                            text: 'forgot_password'.tr,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        icon: const Icon(Icons.password_rounded,
                            color: Color(0xFF519086), size: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
