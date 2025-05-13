class ForgotPasswordModel {
  final String message;
  final dynamic data;
  final List<String>? errors;

  ForgotPasswordModel({required this.message, required this.data, this.errors});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        message: json["message"] ?? '',
        data: json["data"] ?? {},
        errors:
            json["errors"] != null ? List<String>.from(json["errors"]) : null,
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data,
    "errors": errors,
  };
}
