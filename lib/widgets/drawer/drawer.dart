import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth/auth_controller.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(AuthController());
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: Text('Emir'),
          accountEmail: Text('emirseyhana.z@gmail.com'),
          currentAccountPicture:
              CircleAvatar(backgroundColor: Colors.white, child: Text('E')),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            _.logout();
          },
        ),
      ]),
    );
  }
}
