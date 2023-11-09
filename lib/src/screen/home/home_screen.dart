import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../controller/home_controller/home_controller.dart';
import '../../controller/system_controller/system_controller.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/nav_bar/bottom_nav_bar.dart';
import '../../widgets/padding/padding_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cntrl = Get.put(HomeController());
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        drawer: const DrawerMenu(),
        bottomNavigationBar: const BottomNavBar(),
        appBar: appBar(),
        body: body(cntrl),
      ),
    );
  }

  SpeedDial actionButton(
      HomeController cntrl, GeneralSystemController systemCntrl) {
    return SpeedDial(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      childPadding: const EdgeInsets.symmetric(vertical: 10),
      icon: Icons.expand_less_rounded,
      activeIcon: Icons.expand_more_rounded,
      children: [
        SpeedDialChild(
            child: const Icon(Icons.language_rounded),
            label: 'language'.tr,
            onTap: () => systemCntrl.changeLanguage()),
        /* SpeedDialChild(
            child: const Icon(Icons.dark_mode_rounded),
            label: 'mode'.tr,
            onTap: () => systemCntrl.changeTheme()), */
      ],
    );
  }

  SafeArea body(HomeController _) {
    return SafeArea(
      child: TabBarView(children: [
        const Icon(Icons.directions_car),
        quantily(_),
        loop(_),
      ]),
    );
  }

  Widget quantily(HomeController _) {
    return MyPaddingWidget(
      child: ListView.builder(
          controller: _.controller,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  onTap: () => Get.toNamed('/inventoryDetailPage',
                      arguments: {'id': index}),
                  title: Text('Item ${index + 1}'),
                  subtitle: const Text('sub title'),
                  leading: const Icon(Icons.ac_unit),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ));
          }),
    );
  }

  Widget loop(HomeController _) {
    return MyPaddingWidget(
      child: ListView.builder(
          controller: _.controller,
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  title: Text('Item ${index + 1}'),
                  subtitle: const Text('sub title'),
                  leading: const Icon(Icons.ac_unit),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ));
          }),
    );
  }

  AppBar appBar() {
    return AppBar(
        bottom: TabBar(
            labelStyle: const TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent),
            tabs: [
              Tab(text: 'old'.tr),
              Tab(text: 'quanitly'.tr),
              Tab(text: 'loop'.tr),
            ]),
        title: const Text('Home Page'));
  }
}
