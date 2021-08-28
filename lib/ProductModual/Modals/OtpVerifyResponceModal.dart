import 'dart:convert';

OtpVerifyResponceModal otpVerifyResponceModalFromJson(String str) => OtpVerifyResponceModal.fromJson(json.decode(str));

String otpVerifyResponceModalToJson(OtpVerifyResponceModal data) => json.encode(data.toJson());

class OtpVerifyResponceModal {
  bool success;
  Data data;
  bool error;
  String errorMessage;
  String httpResponseHeader;

  OtpVerifyResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
     this.httpResponseHeader,
  });



  factory OtpVerifyResponceModal.fromJson(Map<String, dynamic> json) => OtpVerifyResponceModal(
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
