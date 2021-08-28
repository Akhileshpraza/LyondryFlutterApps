import 'dart:convert';

DeleteAddressResponceModal deleteAddressResponceModalFromJson(String str) => DeleteAddressResponceModal.fromJson(json.decode(str));

String deleteAddressResponceModalToJson(DeleteAddressResponceModal data) => json.encode(data.toJson());

class DeleteAddressResponceModal {
  DeleteAddressResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });

  bool success;
  Data data;
  String error;
  String errorMessage;

  factory DeleteAddressResponceModal.fromJson(Map<String, dynamic> json) => DeleteAddressResponceModal(
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
