import 'package:flutter/material.dart';
import 'package:inventory/src/screen/home/plan_scereen.dart';
import 'package:inventory/src/screen/home/profile.dart';
import '../../screen/home/add_rutin.dart';
import '../../screen/home/home_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const labels = ['Home', 'Plan', 'Add', 'Profile', 'Settings'];
  static const icons = [
    Icons.home,
    Icons.calendar_today_rounded,
    Icons.add,
    Icons.person,
    Icons.settings
  ];
  final List<Widget> pages = const [
    HomePage(),
    PlanScreen(),
    AddRutinPage(),
    ProfilePage(),
    AddRutinPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: List.generate(
          labels.length,
          (i) => BottomNavigationBarItem(
            tooltip: labels[i],
            icon: Icon(icons[i]),
            label: labels[i],
            backgroundColor: const Color(0xFF519087),
          ),
        ),
      ),
    );
  }
}
