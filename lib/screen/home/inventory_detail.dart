import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/padding/padding_widget.dart';

class InventoryDetail extends StatelessWidget {
  const InventoryDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inventory Detail'),
        ),
        body: body());
  }

  SafeArea body() {
    return SafeArea(
        child: MyPaddingWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            inventoryDetailPhoto(),
            userAvatars(),
            oldLoops(),
          ],
        ),
      ),
    ));
  }

  Widget inventoryDetailPhoto() {
    return CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    onError: (exception, stackTrace) => const Text('Error'),
                    image: NetworkImage('https://picsum.photos/250?image=9'),
                    fit: BoxFit.cover)),
          );
        },
        options: CarouselOptions(
            height: 200,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal));
  }

  Widget userAvatars() {
    List<String> userPicture = [
      'https://avatars.githubusercontent.com/u/103196917?v=4',
      'https://avatars.githubusercontent.com/u/56317041?s=96&v=4',
      'https://avatars.githubusercontent.com/u/101975701?s=96&v=4',
      'https://avatars.githubusercontent.com/u/2970703?s=64&v=4',
      'https://avatars.githubusercontent.com/u/71357499?s=96&v=4'
    ];

    List<Widget> avatars = List<Widget>.generate(userPicture.length, (index) {
      return Positioned(
        left: index * 30.0,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(userPicture[index]),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(userPicture[index]),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      );
    });

    return SizedBox(
      height: 50,
      child: Stack(
        children: avatars,
      ),
    );
  }

  Widget oldLoops() {
    return Column(
      children: [
        Text('old'.tr),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                  child: ExpansionTile(
                shape: const RoundedRectangleBorder(),
                title: Text('Item ${index + 1}'),
                children: [
                  ListTile(
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('Item ${index + 1}'),
                  )
                ],
              ));
            }),
      ],
    );
  }
}
