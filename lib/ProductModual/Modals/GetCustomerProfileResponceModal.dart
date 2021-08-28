// To parse this JSON data, do
//
//     final getCustomerProfileResponceModal = getCustomerProfileResponceModalFromJson(jsonString);

import 'dart:convert';

GetCustomerProfileResponceModal getCustomerProfileResponceModalFromJson(String str) => GetCustomerProfileResponceModal.fromJson(json.decode(str));

String getCustomerProfileResponceModalToJson(GetCustomerProfileResponceModal data) => json.encode(data.toJson());

class GetCustomerProfileResponceModal {
  GetCustomerProfileResponceModal({
    this.success,
    this.data,
    this.error,
    this.errorMessage,
  });

  bool success;
  Data data;
  String error;
  String errorMessage;

  factory GetCustomerProfileResponceModal.fromJson(Map<String, dynamic> json) => GetCustomerProfileResponceModal(
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
    this.customerEmailId,
    this.customerName,
    this.customerGender,
    this.customerDob,
  });

  String customerEmailId;
  String customerName;
  String customerGender;
  String customerDob;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerEmailId: json["CustomerEmailId"],
    customerName: json["CustomerName"],
    customerGender: json["CustomerGender"],
    customerDob: json["CustomerDOB"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerEmailId": customerEmailId,
    "CustomerName": customerName,
    "CustomerGender": customerGender,
    "CustomerDOB": customerDob,
  };
}
