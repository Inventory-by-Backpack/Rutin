import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory/src/widgets/snak_bar.dart';
import 'package:jwt_decode_full/jwt_decode_full.dart';
import '../../../core/model/auth/login_model.dart';
import '../../../core/service/auth/requisition/api_req.dart';
import '../system_controller/system_controller.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final DioRequest _dioRequest = DioRequest();
  final GeneralSystemController _generalSystemController =
      Get.put(GeneralSystemController(), permanent: true);
  RxBool isLoading = false.obs;

  void checkLogin() async {
    if (formKey.currentState!.validate()) {
      await login();
    } else {
      _logException('please_fill_in_the_required_fields'.tr,
          color: Colors.red.shade900);
    }
  }

  Future login() async {
    try {
      isLoading.value = true;
      var response = await _dioRequest.login({
        'username': emailController.text,
        'password': passwordController.text
      });
      if (response.data['isSuccess'] == true) {
        final loginModel = loginAccessModelFromJson(jsonEncode(response.data));
        _generalSystemController.refreshToken = loginModel.data.refreshToken;
        _generalSystemController.token = loginModel.data.accessToken;
        _generalSystemController.email = loginModel.data.email;
        final jwtData = jwtDecode(loginModel.data.accessToken);
        final userUid = jwtData.payload[
            'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
        _generalSystemController.userUid = userUid;
        Get.offAllNamed('/homePage');
        isLoading.value = false;
      } else {
        _logException(response.data['message']);
      }
    } on DioException catch (e) {
      _logException(e.response?.data['message']);
    } catch (e) {
      _logException('Sunucu Bakımda Lütfen Daha Sonra Tekrar Deneyiniz');
    } finally {
      isLoading.value = false;
      update();
    }
  }

  void _logException(String message, {Color? color}) {
    ShowSnackMessage.showSnack(message: message, color: color);
  }

  String? formValidate(String? value) {
    if (value!.isEmpty) {
      return 'please_enter_some_text'.tr;
    }
    return null;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
