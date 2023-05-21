import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text('Login Screen'),
          TextField(
            keyboardType: TextInputType.emailAddress,
            controller: loginController.emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            controller: loginController.passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          ElevatedButton(
              onPressed: () {
                loginController.loginUser();
              },
              child: const Text('Login')),
          ElevatedButton(
              onPressed: () {
                Get.toNamed('/registerPage');
              },
              child: const Text('Register')),
        ],
      ),
    )));
  }
}
