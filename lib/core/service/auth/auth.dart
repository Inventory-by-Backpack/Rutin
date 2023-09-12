import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory/core/env/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServies {
  String ip = Env.instance.ip;
  String? languageCode;

  Future<String> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? 'en-US';
  }

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Future<http.Response> register(Map<String, dynamic> data) async {
    languageCode = await getLanguage();
    try {
      Uri url = Uri.parse('$ip/api/$languageCode/Auth/Register');
      return await http
          .post(url, body: jsonEncode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<http.Response> login(Map<String, dynamic> data) async {
    languageCode = await getLanguage();
    try {
      Uri url = Uri.parse('$ip/api/$languageCode/Auth/Login');
      final body = jsonEncode(data);
      final response = await http.post(url, body: body, headers: headers);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<http.Response> userResetPassword(Map<String, dynamic> data) async {
    languageCode = await getLanguage();
    try {
      Uri url = Uri.parse('$ip/api/$languageCode/Auth/SendResetEmail');
      final body = jsonEncode(data);
      final response = await http.post(url, body: body, headers: headers);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
