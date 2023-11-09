import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import '../../controller/system_controller/system_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //AppController appController = Get.put(AppController());
  GeneralSystemController appController =
      Get.put(GeneralSystemController(), permanent: true);
  bool isDisposed = false;

  @override
  void initState() {
    super.initState();
    //burada appController'a istek atıp token var mı yok mu kontrol edilecek
    //eğer token varsa Anasayfaya yönlendirilecek
    //eğer token yoksa LoginPage'e yönlendirilecek
    if (appController.isPrefLoading) {
      _startDelayedNavigation();
    }
  }

  void _startDelayedNavigation() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!isDisposed) {
        if (appController.token == null) {
          Get.offAllNamed('/welcomePage');
        } else {
          Get.offAllNamed('/homePage');
        }
      }
    });
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text('Loading...'),
        ],
      ),
    ));
  }
}
