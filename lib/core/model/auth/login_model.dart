// To parse this JSON data, do
//
//     final loginAccessModel = loginAccessModelFromJson(jsonString);

import 'dart:convert';

LoginAccessModel loginAccessModelFromJson(String str) =>
    LoginAccessModel.fromJson(json.decode(str));

String loginAccessModelToJson(LoginAccessModel data) =>
    json.encode(data.toJson());

class LoginAccessModel {
  Data data;
  bool isSuccess;
  int statusCode;

  LoginAccessModel({
    required this.data,
    required this.isSuccess,
    required this.statusCode,
  });

  factory LoginAccessModel.fromJson(Map<String, dynamic> json) =>
      LoginAccessModel(
        data: Data.fromJson(json["data"]),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
      };
}

class Data {
  int userLoginType;
  String avatar;
  String firstname;
  String lastname;
  String email;
  int gender;
  String accessToken;
  DateTime accessTokenExpiration;
  String refreshToken;
  DateTime refreshTokenExpiration;

  Data({
    required this.userLoginType,
    required this.avatar,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.gender,
    required this.accessToken,
    required this.accessTokenExpiration,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userLoginType: json["userLoginType"],
        avatar: json["avatar"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        gender: json["gender"],
        accessToken: json["accessToken"],
        accessTokenExpiration: DateTime.parse(json["accessTokenExpiration"]),
        refreshToken: json["refreshToken"],
        refreshTokenExpiration: DateTime.parse(json["refreshTokenExpiration"]),
      );

  Map<String, dynamic> toJson() => {
        "userLoginType": userLoginType,
        "avatar": avatar,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "gender": gender,
        "accessToken": accessToken,
        "accessTokenExpiration": accessTokenExpiration.toIso8601String(),
        "refreshToken": refreshToken,
        "refreshTokenExpiration": refreshTokenExpiration.toIso8601String(),
      };
}
