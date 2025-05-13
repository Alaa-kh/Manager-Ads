import 'dart:convert';

VerifyModel verifyModelFromJson(String str) =>
    VerifyModel.fromJson(json.decode(str));

String verifyModelToJson(VerifyModel data) => json.encode(data.toJson());

class VerifyModel {
  final String message;
  final dynamic data;

  VerifyModel({required this.message, required this.data});

  factory VerifyModel.fromJson(Map<String, dynamic> json) =>
      VerifyModel(message: json["message"], data: json["data"]);

  Map<String, dynamic> toJson() => {"message": message, "data": data};
}
