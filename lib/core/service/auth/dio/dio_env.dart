import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../env/static_data.dart';

class AppInterceptor {
  final Dio dio = Dio();
  static const String baseUrl = 'http://159.69.188.101:2023/api';
  late SharedPreferences prefs;

  AppInterceptor() {
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    _setupDio();
  }

  Future<String> _getStoredValue(String key) async {
    return prefs.getString(key) ?? '';
  }

  Future<bool> _setStoredValue(String key, String value) async {
    await prefs.remove(key);
    return await prefs.setString(key, value);
  }

  Future<void> _setupDio() async {
    String lang = await _getStoredValue(Strings.languageCode);
    log('BaseUrl $baseUrl/$lang');
    dio.options = BaseOptions(
      //contentType: 'application/json',
      baseUrl: '$baseUrl/$lang',
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await _getStoredValue(Strings.token);
        options.headers["Authorization"] = "Bearer $token";
        return handler.next(options);
      },
      onError: _handleError,
    ));
  }

  Future<void> _handleError(
      DioException error, ErrorInterceptorHandler handler) async {
    if (error.response?.statusCode == 401) {
      try {
        await _refreshToken();
        return handler.resolve(await dio.request(
            error.response!.requestOptions.path,
            options: Options(headers: error.response!.requestOptions.headers)));
      } catch (err) {
        return handler.reject(DioException(
            requestOptions: error.response!.requestOptions, error: err));
      }
    } else {
      return handler.reject(error);
    }
  }

  Future<void> _refreshToken() async {
    final refToken = await _getStoredValue(Strings.refreshToken);
    final email = await _getStoredValue(Strings.email);
    final response = await dio.post("/Auth/LoginWithRefreshToken", data: {
      "email": email,
      "refreshToken": refToken,
    });

    if (response.statusCode != 200 || response.data['isSuccess'] != true) {
      await prefs.remove(Strings.token);
      await prefs.remove(Strings.refreshToken);
      Get.offAllNamed('/splash');
      throw Exception('Token renewal failed');
    } else {
      await _setStoredValue(
          Strings.token, response.data['data']['accessToken']);
      await _setStoredValue(
          Strings.refreshToken, response.data['data']['refreshToken']);
    }
  }
}
