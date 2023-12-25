import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventory/src/widgets/app_background.dart';
import 'package:inventory/src/widgets/custom_appbar.dart';
import 'package:inventory/src/widgets/padding/padding_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: 'Profile', isBackButton: false),
        body: MyPaddingWidget(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  userInfo(),
                  const SizedBox(height: 20),
                  const Text(
                    'Performance',
                    style: TextStyle(
                      color: Color(0xFF5158FF),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Performance
                  performance(),
                  // Performance
                  const SizedBox(height: 20),
                  const Text(
                    'Teams',
                    style: TextStyle(
                      color: Color(0xFF5158FF),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomButtonRow(
                    userImage: 'assets/user_image/kapali_bacim.png',
                    buttonImages: ["assets/user_image/kara_ablam.png"],
                    buttonText: 'Home',
                  ),
                  const SizedBox(height: 20),
                  const CustomButtonRow(
                    userImage: 'assets/user_image/kapali_bacim.png',
                    buttonImages: [
                      'assets/user_image/marjinal_abim.png',
                      'assets/user_image/mavi_ablam.png',
                    ],
                    buttonText: 'Classmates',
                  ),
                  const SizedBox(height: 20),
                  const CustomButtonRow(
                    userImage: 'assets/user_image/kapali_bacim.png',
                    buttonImages: [
                      'assets/user_image/kara_ablam.png',
                      'assets/user_image/marjinal_abim.png',
                      'assets/user_image/ciftci_kemal.png',
                    ],
                    buttonText: 'Office',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container performance() {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFDCDEFF),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xFF8A8BAB),
            width: 1,
          )),
      child: Row(
        children: [
          RadioMenuButton(
              value: 0,
              groupValue: 1,
              onChanged: (v) {},
              child: const Text('Mon')),
          RadioMenuButton(
              value: 1,
              groupValue: 1,
              onChanged: (v) {},
              child: const Text('Tue')),
          RadioMenuButton(
              value: 1,
              groupValue: 1,
              onChanged: (v) {},
              child: const Text('Wed')),
          RadioMenuButton(
              value: 0,
              groupValue: 1,
              onChanged: (v) {},
              child: const Text('Thu')),
        ],
      ),
    );
  }

  Container userInfo() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(75, 0, 0, 0),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        image: DecorationImage(
            image: const AssetImage('assets/user_image/kapali_bacim.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
              BlendMode.dstATop,
            )),
      ),
      child: Column(
        children: [
          const Spacer(),
          userImage(),
          const Spacer(),
          Text(
            'Azra Gümüş',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFF5158FF),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget userImage() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(75, 0, 0, 0),
            width: 4,
          ),
          color: const Color.fromARGB(125, 240, 163, 139),
          borderRadius: BorderRadius.circular(100)),
      child: const CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage(
          'assets/user_image/kapali_bacim.png',
        ),
      ),
    );
  }
}

class CustomButtonRow extends StatelessWidget {
  final String userImage;
  final List<String> buttonImages;
  final String buttonText;

  const CustomButtonRow({
    super.key,
    required this.userImage,
    required this.buttonImages,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FF),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: const Color.fromARGB(75, 0, 0, 0),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          CircleAvatar(backgroundImage: AssetImage(userImage)),
          const Text(" & "),
          for (String buttonImage in buttonImages) ...[
            CircleAvatar(
              backgroundImage: AssetImage(buttonImage),
            ),
            const SizedBox(width: 10),
          ],
          const Spacer(),
          Text(buttonText),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
