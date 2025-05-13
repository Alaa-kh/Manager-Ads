import 'dart:convert';

AddCampaingModel addCampaingModelFromJson(String str) =>
    AddCampaingModel.fromJson(json.decode(str));

String addCampaingModelToJson(AddCampaingModel data) =>
    json.encode(data.toJson());

class AddCampaingModel {
  final String message;
  final Data data;

  AddCampaingModel({required this.message, required this.data});

  factory AddCampaingModel.fromJson(Map<String, dynamic> json) =>
      AddCampaingModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  final int adId;

  Data({required this.adId});

  factory Data.fromJson(Map<String, dynamic> json) => Data(adId: json["ad_id"]);

  Map<String, dynamic> toJson() => {"ad_id": adId};
}
