import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/service/swagger/swagger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final SwaggerTest _swaggerTest = SwaggerTest();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void checkLogin() async {
    if (formKey.currentState!.validate()) {
      await loginSwagger();
    } else {
      Get.snackbar('Error', 'Please fill in the required fields');
    }
  }

  Future<void> loginSwagger() async {
    Get.defaultDialog(
      title: "Yükleniyor...",
      content: const CircularProgressIndicator(),
      barrierDismissible: false,
    );
    try {
      await _swaggerTest.login({
        "email": emailController.text,
        "password": passwordController.text
      }).then((value) async {
        if (value.statusCode == 200) {
          final body = jsonDecode(value.body);
          final data = body['data'];
          _prefs.then((SharedPreferences prefs) {
            prefs.setString('token', data);
          }).then((value) => Get.offAllNamed('/homePage'));
        } else {
          Get.back();
          _logException('Error', color: Colors.red);
        }
      });
    } catch (e) {
      _logException(e.toString(), color: Colors.red);
    }
  }

  void logOut() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('token');
    Get.offAllNamed('/loginPage');
  }

  void _logException(String message, {Color? color}) {
    Get.showSnackbar(
      GetSnackBar(
          title: message,
          message: message,
          duration: const Duration(seconds: 1),
          backgroundColor: color ?? Colors.red),
    );
  }

  /* final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  Future<void> handleSignIn() async {
    try {
      final credential = await _googleSignIn.signIn();

      if (credential != null) {
        final googleAuth = await credential.authentication;

        final credentialFirebase = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final userCredential = await FirebaseAuth.instance
            .signInWithCredential(credentialFirebase);

        if (userCredential.additionalUserInfo!.isNewUser) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'email': userCredential.user!.email,
            'phone': userCredential.user!.phoneNumber,
            'name': userCredential.user!.displayName,
            'uid': userCredential.user!.uid,
            'profilePicture': userCredential.user!.photoURL,
          });
        } else {
          if (userCredential.user != null) {
            Get.toNamed('/homePage');
          } else {
            Get.snackbar('Error', 'Error');
          }
        }
      } else {
        Get.snackbar('Error', 'Error');
      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  } */
}
