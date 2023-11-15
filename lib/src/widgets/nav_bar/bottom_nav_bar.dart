import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      child: BottomAppBar(
        height: 86,
        color: const Color(0xFF60ABA0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Plan',
              icon: const Icon(Icons.calendar_today_rounded),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Plan',
              icon: const Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Profile',
              icon: const Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
