import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: BottomAppBar(
        height: 86,
        color: const Color(0xFF60ABA0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem('Home', Icons.home, 0, () {
              _navigateToPage('/homePage');
            }),
            _buildNavItem('Plan', Icons.calendar_today_rounded, 1, () {
              _navigateToPage('/forgotPasswordPage');
            }),
            _buildNavItem('Add', Icons.add, 2, () {
              _navigateToPage('/addRutinPage');
            }),
            _buildNavItem('Profile', Icons.person, 3, () {
              _navigateToPage('/forgotPasswordPage');
            }),
            _buildNavItem('Settings', Icons.settings, 4, () {
              _navigateToPage('/inventoryDetailPage');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      String label, IconData icon, int index, VoidCallback onPressed) {
    final isSelected = index == _selectedIndex;
    final color = isSelected ? Colors.white : Colors.white60;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          setState(() {
            _selectedIndex = index;
          });
          onPressed();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF519087) : Colors.transparent,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Icon(icon, color: color),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.48,
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToPage(String route) {
    Navigator.pushNamed(context, route);
  }
}
