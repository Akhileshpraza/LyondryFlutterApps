import 'dart:convert';

UpdateCustomerResponceModal updateCustomerResponceModalFromJson(String str) => UpdateCustomerResponceModal.fromJson(json.decode(str));

String updateCustomerResponceModalToJson(UpdateCustomerResponceModal data) => json.encode(data.toJson());

class UpdateCustomerResponceModal {
  bool success;
  Data data;
  bool error;
  String errorMessage;
  UpdateCustomerResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });



  factory UpdateCustomerResponceModal.fromJson(Map<String, dynamic> json) => UpdateCustomerResponceModal(
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
