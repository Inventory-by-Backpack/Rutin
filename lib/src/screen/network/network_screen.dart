import 'package:flutter/material.dart';

class NetworkErrorPage extends StatelessWidget {
  const NetworkErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 100,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: SizedBox(
                  width: 39.49,
                  height: 40,
                  child: Icon(Icons.wifi_off,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      size: 40)),
            ),
          ),
          Positioned(
            top: 195,
            child: Text(
              'No Connection',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryContainer,
                fontSize: 22,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
