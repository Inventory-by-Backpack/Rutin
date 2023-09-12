import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/system_controller/system_controller.dart';
import '../dialog_widget/dialog_widget.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(GeneralSystemController());
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Emir'),
          accountEmail: Text('emirseyhana.z@gmail.com'),
          currentAccountPicture: CircleAvatar(child: Text('E')),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: Text('home'.tr),
          onTap: () => Get.toNamed('/homePage'),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text('settings'.tr),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: Text('logout'.tr),
          onTap: () {
            cikisDialog(context, _);
          },
        ),
      ]),
    );
  }

  Future<dynamic> cikisDialog(BuildContext context, GeneralSystemController _) {
    return showDialog(
        context: context,
        builder: (context) {
          return ShowDialogWidget(
            title: Text('logout'.tr),
            content: [Text('sure_logout'.tr)],
            actions: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () => _.userLogout(), child: Text('logout'.tr)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                    onPressed: () => Get.close(1), child: Text('cancel'.tr)),
              ),
            ],
          );
        });
  }
}
