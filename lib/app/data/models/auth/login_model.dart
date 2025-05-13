
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
  final String role;
  final String accountStatus;
  final String email;
  final dynamic emailVerifiedAt;
  final String token;
  final Driver driver;

  Data({
    required this.id,
    required this.username,
    required this.role,
    required this.accountStatus,
    required this.email,
    required this.emailVerifiedAt,
    required this.token,
    required this.driver,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    role: json["role"],
    accountStatus: json["account_status"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    token: json["token"],
    driver: Driver.fromJson(json["driver"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "role": role,
    "account_status": accountStatus,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "token": token,
    "driver": driver.toJson(),
  };
}

class Driver {
  final int id;
  final int userId;
  final String placeOfResidence;
  final String workStatus;
  final int age;
  final String number;
  final String nationality;
  final String gender;
  final String carName;
  final String carColor;
  final String carNumber;
  final int carYear;
  final String fileUrl;
  final List<dynamic> ads;

  Driver({
    required this.id,
    required this.userId,
    required this.placeOfResidence,
    required this.workStatus,
    required this.age,
    required this.number,
    required this.nationality,
    required this.gender,
    required this.carName,
    required this.carColor,
    required this.carNumber,
    required this.carYear,
    required this.fileUrl,
    required this.ads,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    userId: json["user_id"],
    placeOfResidence: json["place_of_residence"],
    workStatus: json["work_status"],
    age: json["age"],
    number: json["number"],
    nationality: json["nationality"],
    gender: json["gender"],
    carName: json["car_name"],
    carColor: json["car_color"],
    carNumber: json["car_number"],
    carYear: json["car_year"],
    fileUrl: json["file_url"],
    ads: List<dynamic>.from(json["ads"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "place_of_residence": placeOfResidence,
    "work_status": workStatus,
    "age": age,
    "number": number,
    "nationality": nationality,
    "gender": gender,
    "car_name": carName,
    "car_color": carColor,
    "car_number": carNumber,
    "car_year": carYear,
    "file_url": fileUrl,
    "ads": List<dynamic>.from(ads.map((x) => x)),
  };
}
