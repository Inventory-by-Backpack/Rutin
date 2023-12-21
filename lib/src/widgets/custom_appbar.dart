import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? isBackButton;

  const CustomAppBar({super.key, required this.title, this.isBackButton});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(title,
            style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF519087))),
        leading: isBackButton == false
            ? null
            : Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0x3F519087)),
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
}
