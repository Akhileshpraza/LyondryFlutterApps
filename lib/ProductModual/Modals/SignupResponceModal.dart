import 'dart:convert';

SignupResponceModal signupResponceModalFromJson(String str) => SignupResponceModal.fromJson(json.decode(str));

String signupResponceModalToJson(SignupResponceModal data) => json.encode(data.toJson());

class SignupResponceModal {

  bool success;
  Data data;
  String error;
  String errorMessage;

  SignupResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });



  factory SignupResponceModal.fromJson(Map<String, dynamic> json) => SignupResponceModal(
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

  int customerId;
  String customerName;
  String customerMobileNo;
  String customerEmailId;
  int customerGroupId;
  String entryStatus;


  Data({ this.customerId,
     this.customerName,
     this.customerMobileNo,
     this.customerEmailId,
     this.customerGroupId,
     this.entryStatus,
  });


  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerId: json["CustomerId"],
    customerName: json["CustomerName"],
    customerMobileNo: json["CustomerMobileNo"],
    customerEmailId: json["CustomerEmailId"],
    customerGroupId: json["CustomerGroupId"],
    entryStatus: json["EntryStatus"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerId": customerId,
    "CustomerName": customerName,
    "CustomerMobileNo": customerMobileNo,
    "CustomerEmailId": customerEmailId,
    "CustomerGroupId": customerGroupId,
    "EntryStatus": entryStatus,
  };
}
