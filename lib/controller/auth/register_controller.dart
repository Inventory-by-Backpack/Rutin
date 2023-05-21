import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late GlobalKey<FormState> userFormKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> registerUser() async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .then((value) {
          return FirebaseFirestore.instance
              .collection('users')
              .doc(value.user!.uid)
              .set({
            'email': emailController.text,
            'phone': phoneController.text,
            'name': nameController.text,
            'uid': value.user!.uid
          }).then((value) {
            Get.snackbar('User add', 'User added successfully',
                backgroundColor: Colors.green,
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white);
            emailController.clear();
            phoneController.clear();
            passwordController.clear();
            userFormKey.currentState!.reset();
          });
        });
        if (credential.user != null) {
          Get.toNamed('/homePage');
        } else {
          Get.snackbar('Error', 'Error');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar('Error', 'The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar('Error', 'The account already exists for that email.');
        }
        Get.snackbar('Not added user', e.message.toString(),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(Icons.error, color: Colors.white));
      }
    } else {
      Get.snackbar('Error', 'Password not match');
    }
  }
}
