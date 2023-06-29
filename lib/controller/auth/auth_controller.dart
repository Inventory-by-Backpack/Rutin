import 'package:connectivity_plus/connectivity_plus.dart';
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

  Future<bool> checkInternetConnection() async {
    ConnectivityResult result = await (Connectivity().checkConnectivity());
    if (result != ConnectivityResult.none) {
      return true; // İnternet bağlantısı var
    } else {
      return false; // İnternet bağlantısı yok
    }
  }

  void userLogin() async {
    final SharedPreferences sharedPreferences = await _sharedPreferences;
    final isResult = await checkInternetConnection();
    if (!isResult) {
      if (sharedPreferences.getString('token') == null) {
        Get.offAllNamed('/loginPage');
      } else {
        Get.offAllNamed('/homePage');
      }
    } else {
      Get.toNamed('/networkErrorPage');
    }
  }
}
