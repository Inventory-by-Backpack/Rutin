import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/login_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
              icon: Icon(Icons.login_outlined),
              onPressed: () {
                loginController.logOut();
              }),
        ],
      ),
      body: SafeArea(
          child: Center(
        child: Text('HomePage'),
      )),
    );
  }
}
