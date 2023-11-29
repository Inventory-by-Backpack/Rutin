import 'package:flutter/material.dart';

import '../../widgets/app_background.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/nav_bar/bottom_nav_bar.dart';

class AddRutinPage extends StatelessWidget {
  const AddRutinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'Create new Rutin'),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
