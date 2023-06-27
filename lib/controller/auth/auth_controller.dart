import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();
  @override
  void onInit() {
    super.onInit();
    userLogin();
  }

  void userLogin() async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;

    if (sharedPreferences.getString('token') == null) {
      Get.offAllNamed('/loginPage');
    } else {
      Get.offAllNamed('/homePage');
    }

    /* _auth.authStateChanges().listen((event) {
      if (kDebugMode) {
        print(event);
      }
      if (event != null) {
        Get.offAllNamed('/homePage');
      } else {
        Get.offAllNamed('/loginPage');
      }
    }); */
  }
}
