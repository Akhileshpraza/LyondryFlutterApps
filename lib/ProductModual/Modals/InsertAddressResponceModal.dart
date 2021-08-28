import 'dart:convert';

InsertAddressResponceModal insertAddressResponceModalFromJson(String str) => InsertAddressResponceModal.fromJson(json.decode(str));

String insertAddressResponceModalToJson(InsertAddressResponceModal data) => json.encode(data.toJson());

class InsertAddressResponceModal {
  InsertAddressResponceModal({
      this.success,
      this.data,
      this.error,
      this.errorMessage,
  });

  bool success;
  Data data;
  String error;
  String errorMessage;

  factory InsertAddressResponceModal.fromJson(Map<String, dynamic> json) => InsertAddressResponceModal(
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
