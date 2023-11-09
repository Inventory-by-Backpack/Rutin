import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_background.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/padding/padding_widget.dart';
import '../../widgets/text_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'forgot_password'.tr),
        body: SafeArea(
          child: MyPaddingWidget(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Text(
                    'email'.tr,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600),
                  ),
                  const MyTextFormField(
                    hintText: 'user@gmail.com',
                  ),
                  const SizedBox(height: 20),
                  MyElevatedButton(
                      onPressed: () {}, string: 'send_reset_link'.tr),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
