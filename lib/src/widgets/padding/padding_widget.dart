import 'package:flutter/material.dart';

class MyPaddingWidget extends StatelessWidget {
  const MyPaddingWidget({required this.child, super.key});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: child,
    );
  }
}
