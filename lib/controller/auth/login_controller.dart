import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/service/swagger/swagger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late GlobalKey<FormState> loginFormKey;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final SwaggerTest _swaggerTest = SwaggerTest();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    super.onInit();
    loginFormKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      print(isValid);

      return;
    } else {
      loginFormKey.currentState!.save();
      await loginSwagger();
    }
  }

  Future<void> loginSwagger() async {
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
          Get.snackbar('Error', 'Error');
        }
      });
    } catch (e) {
      Future.error(e.toString());
    }
  }

  void logOut() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove('token');
    Get.offAllNamed('/loginPage');
    // await FirebaseAuth.instance.signOut();
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
