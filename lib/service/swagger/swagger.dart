import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SwaggerTest {
  late String ip = "'http://sosocrm.oetech.online/api/Auth/login";

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  Future<Map<String, String>> getHeaders() async {
    String token = await getToken();
    Map<String, String> headers = {
      "Access-Control-Allow-Origin": "http://portalweb.oetech.online/",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Connection': 'keep-alive',
      'Authorization': token
    };
    //print(token);
    return headers;
  }

  Future<http.Response> login(Map<String, dynamic> data) async {
    try {
      final url = Uri.parse("http://sosocrm.oetech.online/api/Auth/login");
      final body = jsonEncode(data);
      final headers = await getHeaders(); // Use the updated getHeaders() method
      final response =
          await http.post(url, body: body , headers: headers);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
