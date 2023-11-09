import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/app_background.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/padding/padding_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Image.asset('assets/splash.png', height: 50),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 20, // Üstte ortada
                left: 0, // Sol kenarda
                right: 0, // Sağ kenarda
                child: Image.asset(
                  "assets/green backpack with books.png",
                  height: 177,
                ),
              ),
              Positioned(
                top: 220, // Birinci fotoğrafın altında
                left: 0, // Sol kenarda
                child: Image.asset(
                  "assets/Paper bag full of groceries.png",
                  height: 200,
                ),
              ),
              Positioned(
                top: 420, // İkinci fotoğrafın altında
                right: 0, // Sağ kenarda
                child: Image.asset(
                  "assets/trolley with two cardboard boxes.png",
                  height: 251,
                ),
              ),
              Positioned(
                bottom: 40, // En altta
                left: 0, // Sol kenarda
                right: 0, // Sağ kenarda
                child: MyPaddingWidget(
                  child: Column(
                    children: [
                      MyElevatedButton(string: 'Get Started', onPressed: () {}),
                      const SizedBox(height: 10),
                      // Buton ile metin arasındaki boşluk
                      Text.rich(
                        TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(
                            color: Color(0xff519087),
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed('/loginPage');
                                },
                              text: 'Login',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
