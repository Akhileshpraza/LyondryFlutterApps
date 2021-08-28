import 'dart:convert';

UpdateAddressResponceModal updateAddressResponceModalFromJson(String str) => UpdateAddressResponceModal.fromJson(json.decode(str));

String updateAddressResponceModalToJson(UpdateAddressResponceModal data) => json.encode(data.toJson());

class UpdateAddressResponceModal {
  UpdateAddressResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });

  bool success;
  Data data;
  String error;
  String errorMessage;

  factory UpdateAddressResponceModal.fromJson(Map<String, dynamic> json) => UpdateAddressResponceModal(
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
