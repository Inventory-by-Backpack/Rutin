import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
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
                email: emailController.text, password: passwordController.text);
        if (credential.user != null) {
          await credential.user?.updateDisplayName(nameController.text);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(credential.user!.uid)
              .set({
            'email': emailController.text,
            'phone': phoneController.text,
            'name': nameController.text,
            'uid': credential.user!.uid,
            'profilePicture': '',
          });
          Get.snackbar('User add', 'User added successfully',
              backgroundColor: Colors.green,
              snackPosition: SnackPosition.BOTTOM,
              colorText: Colors.white);
          emailController.clear();
          phoneController.clear();
          passwordController.clear();
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
      }
    } else {
      Get.snackbar('Error', 'Password not match');
    }
  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return 'Sikik';
  }
}
