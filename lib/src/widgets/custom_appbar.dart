import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xFF519086),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0x3F519087)),
                borderRadius: BorderRadius.circular(25),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x33598077),
                  blurRadius: 13,
                  offset: Offset(0, 7),
                  spreadRadius: -3,
                ),
                BoxShadow(
                  color: Color(0x4C598077),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              iconSize: 20,
              color: const Color(0xFF519086),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
