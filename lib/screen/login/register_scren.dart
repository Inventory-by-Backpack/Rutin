import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/register_controller.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Page'),
        ),
        body: SafeArea(
            child: Center(
          child: Form(
            key: registerController.userFormKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: registerController.nameController,
                    decoration: const InputDecoration(hintText: 'Name'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: registerController.emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: registerController.passwordController,
                    decoration: const InputDecoration(hintText: 'password'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: registerController.confirmPasswordController,
                    decoration:
                        const InputDecoration(hintText: 'confirm password'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: registerController.phoneController,
                    decoration: const InputDecoration(hintText: 'phone'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        registerController.registerUser();
                      },
                      child: const Text('Register')),
                ],
              ),
            ),
          ),
        )));
  }
}
