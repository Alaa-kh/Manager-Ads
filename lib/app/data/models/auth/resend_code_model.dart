
import 'dart:convert';

ResendCodeModel resendCodeModelFromJson(String str) =>
    ResendCodeModel.fromJson(json.decode(str));

String resendCodeModelToJson(ResendCodeModel data) =>
    json.encode(data.toJson());

class ResendCodeModel {
  final String message;
  final dynamic data;

  ResendCodeModel({required this.message, required this.data});

  factory ResendCodeModel.fromJson(Map<String, dynamic> json) =>
      ResendCodeModel(message: json["message"], data: json["data"]);

  Map<String, dynamic> toJson() => {"message": message, "data": data};
}
