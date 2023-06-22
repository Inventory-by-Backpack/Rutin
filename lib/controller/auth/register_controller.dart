import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../service/rest_log.dart';

class RegisterController extends GetxController {
  final _userLoginServies = UserLoginServies();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  //TextEditingController phoneController = TextEditingController();

  Future<void> registerUser() async {
    try {
      final SharedPreferences prefs = await _prefs;
      if (passwordController.text == confirmPasswordController.text) {
        final response = await _userLoginServies.postRegister({
          "name": nameController.text,
          "email": emailController.text.trim(),
          "password": passwordController.text,
        });
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['code'] == 0) {
            final token = data['data']['Token'];
            print(token);
            prefs.setString('token', token);
            nameController.clear();
            emailController.clear();
            passwordController.clear();
            confirmPasswordController.clear();
            Get.offAllNamed('/homePage');
          } else {
            Get.snackbar('Error', data['message']);
          }
        } else {
          print(response.body);
          print(response.statusCode);
        }

        /* try {
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
      } */
      } else {
        Get.snackbar('Error', 'Password not match');
      }
    } catch (e) {
      Get.snackbar('Error', '$e');
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
