import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/app_background.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/padding/padding_widget.dart';
import '../../widgets/text_form.dart';

class AddRutinPage extends StatelessWidget {
  const AddRutinPage({super.key});

  static const List<String> userPicture = [
    'https://avatars.githubusercontent.com/u/103196917?v=4',
    'https://avatars.githubusercontent.com/u/56317041?s=96&v=4',
    'https://avatars.githubusercontent.com/u/101975701?s=96&v=4',
    'https://avatars.githubusercontent.com/u/2970703?s=64&v=4',
    'https://avatars.githubusercontent.com/u/71357499?s=96&v=4'
  ];

  static const List<String> icerik = [
    "Daily",
    "Loop",
    "Pets & Plants",
    "Home",
  ];

  static const List<String> path = [
    "assets/logo.png",
    "assets/logo.png",
    "assets/new_rutin/cactus.jpeg",
    "assets/Paper bag full of groceries.png",
  ];

  static const List<IconData> icon = [
    Icons.add_photo_alternate_rounded,
    Icons.video_collection_rounded,
    Icons.music_note_rounded,
    Icons.description_rounded,
  ];

  static TextStyle poppinsStyle = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF519087),
  );

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar:
            const CustomAppBar(title: 'Create new Rutin', isBackButton: false),
        body: SafeArea(
          child: MyPaddingWidget(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  pageText('Name'),
                  bosluk(context),
                  const MyTextFormField(
                    hintText: 'Watering the plant',
                    inputType: TextInputType.text,
                  ),
                  bosluk(context),
                  pageText('Detail'),
                  bosluk(context),
                  buildGridView(icerik, customContainer),
                  bosluk(context),
                  pageText('People'),
                  bosluk(context),
                  userAvatars(),
                  bosluk(context),
                  pageText('Info'),
                  bosluk(context),
                  const MyTextFormField(
                    hintText:
                        'Watering the plants of living room according their needs every day',
                    inputType: TextInputType.text,
                  ),
                  bosluk(context),
                  pageText('Add Media'),
                  bosluk(context),
                  buildGridView(icerik, customContainer2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userAvatars() {
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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 50,
      child: Stack(
        alignment: Alignment.centerRight,
        children: avatars,
      ),
    );
  }

  Container customContainer(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            opacity: 0.4, image: AssetImage(path[index]), fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: Text(icerik[index], style: poppinsStyle)),
    );
  }

  Container customContainer2(int index) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD3FCF6),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon[index],
            color: const Color(0xFF519087),
          ),
          const SizedBox(width: 10),
          Text(icerik[index], style: poppinsStyle),
        ],
      )),
    );
  }

  Padding bosluk(BuildContext context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01));

  Text pageText(String text) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF519087)),
    );
  }

  Widget buildGridView(List<String> items, Function(int) itemBuilder) {
    return GridView.custom(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5 / 1,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      childrenDelegate: SliverChildListDelegate.fixed(
        List.generate(
          items.length,
          (index) => itemBuilder(index),
        ),
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
