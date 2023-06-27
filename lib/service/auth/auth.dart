import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory/env/api.dart';

class UserLoginServies {
  String ip = Env.instance.ip;
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
  Future<http.Response> register(Map data) {
    try {
      Uri url = Uri.parse('$ip/api/Auth/Register');
      return http
          .post(url, body: jsonEncode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<http.Response> login(Map<String, dynamic> data) async {
    try {
      Uri url = Uri.parse('$ip/api/Auth/Login');
      final body = jsonEncode(data);
      final response = await http.post(url, body: body, headers: headers);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
