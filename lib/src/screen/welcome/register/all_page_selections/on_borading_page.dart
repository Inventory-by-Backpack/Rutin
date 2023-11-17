import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../../../widgets/app_background.dart';
import 'choose_pages.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const decor = PageDecoration(
      bodyAlignment: Alignment.center,
    );

    void onIntroEnd(context) {
      Get.offAllNamed('/registerPage');
    }

    return AppBackground(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        pages: [
          PageViewModel(
            decoration: decor,
            title: '',
            bodyWidget: const ChoosePage(),
          ),
          PageViewModel(
            decoration: decor,
            title: '',
            bodyWidget: const ChoosePage1(),
          ),
          PageViewModel(
            decoration: decor,
            title: '',
            bodyWidget: const ChoosePage2(),
          ),
          PageViewModel(
            decoration: decor,
            title: '',
            bodyWidget: const ChoosePage3(),
          ),
        ],
        onDone: () => onIntroEnd(context),
        onSkip: () => onIntroEnd(context),
        showSkipButton: false,
        next: const Icon(Icons.arrow_forward_rounded, color: Color(0xFF519087)),
        done: const Text('Continune',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF519087),
            )),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeColor: Color(0xFF519087),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
