import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  Future login() async {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed('/homePage');
      isLoading.value = false;
    });
  }
}
