import 'dart:convert';

LoginResponceModal loginResponceModalFromJson(String str) => LoginResponceModal.fromJson(json.decode(str));

String loginResponceModalToJson(LoginResponceModal data) => json.encode(data.toJson());

class LoginResponceModal {
  bool success;
  Data data;
  bool error;
  String errorMessage;
  String httpResponseHeader;

  LoginResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
     this.httpResponseHeader,
  });



  factory LoginResponceModal.fromJson(Map<String, dynamic> json) => LoginResponceModal(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
    httpResponseHeader: json["HttpResponseHeader"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "Error": error,
    "ErrorMessage": errorMessage,
    "HttpResponseHeader": httpResponseHeader,
  };
}

class Data {
  int customerId;
  String customerEmailId;
  String customerMobileNo;
  String customerName;
  String entryStatus;
  Data({
     this.customerId,
     this.customerEmailId,
     this.customerMobileNo,
     this.customerName,
     this.entryStatus,
  });



  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerId: json["CustomerId"],
    customerEmailId: json["CustomerEmailId"],
    customerMobileNo: json["CustomerMobileNo"],
    customerName: json["CustomerName"],
    entryStatus: json["EntryStatus"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerId": customerId,
    "CustomerEmailId": customerEmailId,
    "CustomerMobileNo": customerMobileNo,
    "CustomerName": customerName,
    "EntryStatus": entryStatus,
  };
}
