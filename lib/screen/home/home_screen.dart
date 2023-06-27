import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(icon: const Icon(Icons.login_outlined), onPressed: () {}),
        ],
      ),
      body: const SafeArea(
          child: Center(
        child: Text('HomePage'),
      )),
    );
  }
}
