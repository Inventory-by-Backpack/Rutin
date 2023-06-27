import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cntrl = Get.put(HomeController());
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
          bottomNavigationBar: bottomNavBar(cntrl),
          appBar: appBar(),
          body: body()),
    );
  }

  bottomNavBar(HomeController cntrl) {
    return Obx(() => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.pink,
            ),
          ],
          currentIndex: cntrl.selectedIndex.value,
          selectedItemColor: Colors.grey[500],
          unselectedItemColor: Colors.grey[300],
          onTap: cntrl.onItemTapped,
        ));
  }

  TabBarView body() {
    return TabBarView(children: [
      Icon(Icons.directions_car),
      quantily(),
      Icon(Icons.directions_bike),
    ]);
  }

  Widget quantily() {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            height: 100,
            color: Colors.amber[200],
          );
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
