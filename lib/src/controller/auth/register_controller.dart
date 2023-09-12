import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/snak_bar.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //final _userLoginServies = UserLoginServies();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  //TextEditingController phoneController = TextEditingController();

  void isValid() {
    if (formKey.currentState!.validate()) {
      registerUser();
    } else {
      _logException('please_fill_in_the_required_fields'.tr,
          color: Colors.red.shade900);
    }
  }

  RxString? selectGender;
  String? selectGenderValue;
  void selectGenderFunc(String? value) {
    selectGender?.value = value.toString();
    selectGenderValue = value;
  }

  Future<void> registerUser() async {
    Get.defaultDialog(
        title: "loading".tr,
        content: const CircularProgressIndicator(),
        barrierDismissible: false);
    try {
      /*    if (passwordController.text == confirmPasswordController.text) {
        final response = await _userLoginServies.register({
          "userLoginType": 0,
          "firstname": firstname.text,
          "lastname": lastname.text,
          "email": emailController.text,
          "gender": int.parse(selectGenderValue!),
          "password": passwordController.text,
          "deviceType": Platform.operatingSystem
        });
        final data = jsonDecode(response.body);
        if (response.statusCode == 200) {
          /*  firstname.clear();
          lastname.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear(); */
          Get.back(); //İlk önce dialog kapatılır
          _logException(data['message'].toString(), color: Colors.green);
          Get.offAllNamed('/loginPage');
        } else {
          Get.back(); //İlk önce dialog kapatılır
          _logException(data['message'], color: Colors.red);
        }
      } else {
        Get.back();
        _logException('passowrd_not_mach'.tr, color: Colors.red);
      } */
    } catch (e) {
      Get.back();
      _logException(e.toString(), color: Colors.red);
    }
  }

  void _logException(String message, {Color? color}) {
    ShowSnackMessage.showSnack(message: message, color: color ?? Colors.red);
  }

  String? formValidate(String? value) {
    if (value!.isEmpty) {
      return 'please_enter_some_text'.tr;
    }
    return null;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstname.dispose();
    lastname.dispose();
    super.onClose();
  }
}
