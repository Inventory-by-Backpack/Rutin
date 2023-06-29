import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller/home_controller.dart';
import '../../widgets/drawer/drawer.dart';
import '../../widgets/nav_bar/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cntrl = Get.put(HomeController());
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Obx(() => Scaffold(
            drawer: DrawerMenu(),
            bottomNavigationBar: BottomNavBar(
                isElevated: cntrl.isEleveted.value,
                isVisible: cntrl.isVisible.value),
            floatingActionButton: cntrl.showFab.value
                ? FloatingActionButton(
                    tooltip: 'Add New Item',
                    elevation: cntrl.isVisible.value ? 0.0 : null,
                    child: const Icon(Icons.add),
                    onPressed: () {})
                : null,
            floatingActionButtonLocation: cntrl.fabLocation,
            appBar: appBar(),
            body: body(cntrl),
          )),
    );
  }

  SafeArea body(HomeController _) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: TabBarView(children: [
          Icon(Icons.directions_car),
          quantily(_),
          loop(_),
        ]),
      ),
    );
  }

  Widget quantily(HomeController _) {
    return ListView.builder(
        controller: _.controller,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Color(0xffEFEFEF),
              child: ListTile(
                title: Text('Item ${index + 1}'),
                subtitle: Text('sub title'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
              ));
        });
  }

  Widget loop(HomeController _) {
    return ListView.builder(
        controller: _.controller,
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              color: Color(0xffEFEFEF),
              child: ListTile(
                title: Text('Item ${index + 1}'),
                subtitle: Text('sub title'),
                leading: Icon(Icons.ac_unit),
                trailing: Icon(Icons.arrow_forward_ios),
              ));
        });
  }

  AppBar appBar() {
    return AppBar(
        bottom: TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700),
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent),
            tabs: [
              Tab(text: 'old'),
              Tab(text: 'quanitly'),
              Tab(text: 'loop'),
            ]),
        title: const Text('Home Page'));
  }
}
