import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/model/home/home_model.dart';
import '../../widgets/app_background.dart';
import '../../widgets/nav_bar/bottom_nav_bar.dart';
import '../../widgets/padding/padding_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: const BottomNavBar(),
          appBar: tabBar(),
          body: body(),
        ),
      ),
    );
  }

  Widget body() {
    return const SafeArea(
      child: TabBarView(children: [
        OldWidget(),
        QuantityWidget(),
        CyclicalWidget(),
      ]),
    );
  }

  TabBar tabBar() {
    return TabBar(
      labelColor: const Color(0xFF519086),
      unselectedLabelColor: const Color(0xFF8A9795),
      padding:
          EdgeInsets.only(top: MediaQuery.of(Get.context!).size.height * 0.05),
      labelStyle: const TextStyle(
        fontSize: 18,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
      ),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
      tabs: [
        Tab(text: 'old'.tr),
        Tab(text: 'quanitly'.tr),
        Tab(text: 'loop'.tr),
      ],
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    Key? key,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.bodyTextStyle,
    required this.dataList,
  }) : super(key: key);

  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle bodyTextStyle;
  final List<HomeModel> dataList;

  @override
  Widget build(BuildContext context) {
    return MyPaddingWidget(
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (BuildContext context, int index) {
          final data = dataList[index];
          return CustomCard(
            data: data,
            titleTextStyle: titleTextStyle,
            subtitleTextStyle: subtitleTextStyle,
            bodyTextStyle: bodyTextStyle,
          );
        },
      ),
    );
  }
}

class CyclicalWidget extends StatelessWidget {
  const CyclicalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );

    const subtitleTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );

    const bodyTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );

    return CustomWidget(
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      bodyTextStyle: bodyTextStyle,
      dataList: cyclicalList,
    );
  }
}

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );

    const subtitleTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );

    const bodyTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );

    return CustomWidget(
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      bodyTextStyle: bodyTextStyle,
      dataList: quantityList,
    );
  }
}

class OldWidget extends StatelessWidget {
  const OldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );

    const subtitleTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );

    const bodyTextStyle = TextStyle(
      color: Color(0xFF519086),
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );

    return CustomWidget(
      titleTextStyle: titleTextStyle,
      subtitleTextStyle: subtitleTextStyle,
      bodyTextStyle: bodyTextStyle,
      dataList: oldList,
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.data,
    required this.titleTextStyle,
    required this.subtitleTextStyle,
    required this.bodyTextStyle,
  }) : super(key: key);

  final HomeModel data;
  final TextStyle titleTextStyle;
  final TextStyle subtitleTextStyle;
  final TextStyle bodyTextStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/inventoryDetailPage');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            image: data.image == null
                ? null
                : DecorationImage(
                    opacity: 0.3,
                    image: AssetImage(data.image.toString()),
                    fit: BoxFit.cover,
                  ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title, style: titleTextStyle),
                  Text(data.description, style: subtitleTextStyle),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Text(data.username, style: bodyTextStyle),
                  const Spacer(),
                  Text(data.duration, style: bodyTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<HomeModel> cyclicalList = [
  HomeModel(
    title: 'Cat food  🐈 🍎',
    description: ' * For Pamuk\n *Molly, Adult 4kg',
    username: 'You',
    duration: '2 days',
  ),
  HomeModel(
      title: 'Company vehicle 🚙 ⛽️',
      description: '* Opet\n *Total\n *Shell',
      username: 'You, Burak',
      duration: '2 days',
      image: 'assets/home_assets/2020-porsche-taycan.jpg'),
  HomeModel(
    title: 'Red Candles  🕯️️🍷',
    description: '* Ikea',
    username: 'you, Rachael',
    duration: '4 days',
  ),
];
//
List<HomeModel> quantityList = [
  HomeModel(
      title: 'Company vehicle 🚙 ⛽️',
      description: '* Opet\n *Total\n *Shell',
      username: 'You, Emir',
      duration: '20 days',
      image: 'assets/home_assets/2020-porsche-taycan.jpg'),
  HomeModel(
      title: 'Company vehicle 🚙 ⛽️',
      description: '* SuperCharger\n *Tesla',
      username: 'You, Mahmut',
      duration: '30 days',
      image: 'assets/home_assets/Tesla Model S Plaid evo 23.jpg'),
];
//
List<HomeModel> oldList = [
  HomeModel(
    title: 'Red Candles  🕯️️🍷',
    description: '* Ikea',
    username: 'you, Rachael',
    duration: '90 days',
  ),
  HomeModel(
      title: 'Company vehicle 🚙 ⛽️',
      description: '* Opet\n *Total\n *Shell',
      username: 'You, Emir',
      duration: '2 days',
      image: 'assets/home_assets/2020-porsche-taycan.jpg'),
  HomeModel(
    title: 'Cat food  🐈 🍎',
    description: ' * For Pamuk\n *Molly, Adult 4kg',
    username: 'You',
    duration: '86 days',
  ),
  HomeModel(
      title: 'Company vehicle 🚙 ⛽️',
      description: '* SuperCharger\n *Tesla',
      username: 'You, Mahmut',
      duration: '30 days',
      image: 'assets/home_assets/Tesla Model S Plaid evo 23.jpg'),
];
