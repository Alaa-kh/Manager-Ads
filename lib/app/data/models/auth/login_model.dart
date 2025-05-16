// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String message;
  final Data data;

  LoginModel({required this.message, required this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(message: json["message"], data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  final int id;
  final String username;
  final String ipAddress;
  final String role;
  final String accountStatus;
  final String email;
  final dynamic emailVerifiedAt;
  final String token;

  Data({
    required this.id,
    required this.username,
    required this.ipAddress,
    required this.role,
    required this.accountStatus,
    required this.email,
    required this.emailVerifiedAt,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    ipAddress: json["ip_address"],
    role: json["role"],
    accountStatus: json["account_status"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "ip_address": ipAddress,
    "role": role,
    "account_status": accountStatus,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "token": token,
  };
}
