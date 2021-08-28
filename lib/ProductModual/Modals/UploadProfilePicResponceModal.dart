import 'dart:convert';

UploadProfilePicResponceModal uploadProfilePicResponceModalFromJson(String str) => UploadProfilePicResponceModal.fromJson(json.decode(str));

String uploadProfilePicResponceModalToJson(UploadProfilePicResponceModal data) => json.encode(data.toJson());

class UploadProfilePicResponceModal {
  UploadProfilePicResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });

  bool success;
  Data data;
  bool error;
  String errorMessage;

  factory UploadProfilePicResponceModal.fromJson(Map<String, dynamic> json) => UploadProfilePicResponceModal(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class Data {
  Data({
     this.status,
  });

  String status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
  };
}
