import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (credential.user != null) {
        Get.toNamed('/homePage');
      } else {
        Get.snackbar('Error', 'Error');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'No user found for that email.');
        if (kDebugMode) {
          print('No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Wrong password provided for that user.');
        if (kDebugMode) {
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
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
  }
}
