import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    userLogin();
  }

  void userLogin() {
    _auth.authStateChanges().listen((event) {
      if (kDebugMode) {
        print(event);
      }
      if (event != null) {
        Get.offAllNamed('/homePage');
      } else {
        Get.offAllNamed('/loginPage');
      }
    });
  }
}
