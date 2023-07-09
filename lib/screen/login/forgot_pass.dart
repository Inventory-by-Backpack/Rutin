import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../widgets/elevated_button.dart';
import '../../widgets/padding/padding_widget.dart';
import '../../widgets/text_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MyPaddingWidget(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Expanded(
                  flex: 3,
                  child: Text(
                    'forgot_password'.tr,
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
                        Text(
                          'email'.tr,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const MyTextFormField(
                          hintText: 'user@gmail.com',
                        ),
                        const SizedBox(height: 20),
                        MyElevatedButton(
                          onPressed: () {},
                          string: 'send_reset_link'.tr,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
