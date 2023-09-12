// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  Data? data;
  bool? isSuccess;
  int? statusCode;

  LoginModel({
    this.data,
    this.isSuccess,
    this.statusCode,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        isSuccess: json["isSuccess"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "isSuccess": isSuccess,
        "statusCode": statusCode,
      };
}

class Data {
  int? userLoginType;
  String? avatar;
  String? firstname;
  String? lastname;
  String? email;
  int? gender;
  String? accessToken;

  Data({
    this.userLoginType,
    this.avatar,
    this.firstname,
    this.lastname,
    this.email,
    this.gender,
    this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userLoginType: json["userLoginType"],
        avatar: json["avatar"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        gender: json["gender"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "userLoginType": userLoginType,
        "avatar": avatar,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "gender": gender,
        "accessToken": accessToken,
      };
}
