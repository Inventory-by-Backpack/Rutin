import 'dart:convert';

import 'package:http/http.dart' as http;

class UserLoginServies {
  String ip = "http://restapi.adequateshop.com/api/authaccount/registration";
  Map<String, String> headers = {'Content-Type': 'application/json'};
  Future<http.Response> postRegister(Map data) {
    try {
      Uri url = Uri.parse(ip);
      return http
          .post(url, body: jsonEncode(data), headers: headers)
          .timeout(const Duration(seconds: 30));
    } catch (e) {
      return Future.error(e);
    }
  }
}
