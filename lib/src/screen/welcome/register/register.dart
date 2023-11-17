import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/login_controller.dart';
import '../../../widgets/app_background.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/elevated_button.dart';
import '../../../widgets/padding/padding_widget.dart';
import '../../../widgets/text_form.dart';
import '../login/widget/login_text_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: 'Register', isBackButton: false),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Obx(
            () => MyElevatedButton(
              string: loginController.isLoading.value == false
                  ? 'Create Account'
                  : 'Loading',
              onPressed: loginController.isLoading.value == false
                  ? () {
                      loginController.login();
                    }
                  : null,
            ),
          ),
        ),
        body: SafeArea(
          child: MyPaddingWidget(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AuthTextWidget(text: 'Name & Surname'.tr),
                    const SizedBox(height: 15),
                    const MyTextFormField(
                        hintText: 'Emir Seyhan',
                        inputType: TextInputType.name,
                        privacy: false),
                    const SizedBox(height: 15),
                    AuthTextWidget(text: 'email'.tr),
                    const SizedBox(height: 15),
                    const MyTextFormField(
                        hintText: '+90 555 555 55 55',
                        inputType: TextInputType.text,
                        privacy: false),
                    const SizedBox(height: 15),
                    AuthTextWidget(text: 'password'.tr),
                    const SizedBox(height: 15),
                    const MyTextFormField(
                        hintText: '*****',
                        inputType: TextInputType.visiblePassword,
                        privacy: true),
                    const SizedBox(height: 15),
                    AuthTextWidget(text: 'confirm password'.tr),
                    const SizedBox(height: 15),
                    const MyTextFormField(
                        hintText: '*****',
                        inputType: TextInputType.visiblePassword,
                        privacy: true),
                    TextButton.icon(
                      onPressed: () {
                        Get.toNamed('/forgotPasswordPage');
                      },
                      label: AuthTextWidget(
                          text: 'terms & conditions'.tr,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      icon: const Icon(Icons.link,
                          color: Color(0xFF519086), size: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
