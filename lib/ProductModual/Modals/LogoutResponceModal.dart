// To parse this JSON data, do
//
//     final logoutResponceModal = logoutResponceModalFromJson(jsonString);

import 'dart:convert';

LogoutResponceModal logoutResponceModalFromJson(String str) => LogoutResponceModal.fromJson(json.decode(str));

String logoutResponceModalToJson(LogoutResponceModal data) => json.encode(data.toJson());

class LogoutResponceModal {
  bool success;
  Data data;
  String error;
  String errorMessage;

  LogoutResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });



  factory LogoutResponceModal.fromJson(Map<String, dynamic> json) => LogoutResponceModal(
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
  String status;
  Data({
     this.status,
  });



  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
  };
}
