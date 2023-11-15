import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget? child;
  const AppBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 0.8,
          focalRadius: 0.1,
          center: Alignment.centerRight,
          colors: [
            Color(0xFF90B1C3),
            Colors.white,
          ],
        ),
      ),
      child: child,
    );
  }
}
