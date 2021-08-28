import 'dart:convert';

GetProfilePicResponceModal getProfilePicResponceModalFromJson(String str) => GetProfilePicResponceModal.fromJson(json.decode(str));

String getProfilePicResponceModalToJson(GetProfilePicResponceModal data) => json.encode(data.toJson());

class GetProfilePicResponceModal {
  GetProfilePicResponceModal({
    this.success,
    this.data,
    this.error,
    this.errorMessage,
  });

  bool success;
  Data data;
  String error;
  String errorMessage;

  factory GetProfilePicResponceModal.fromJson(Map<String, dynamic> json) => GetProfilePicResponceModal(
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
    this.customerProfilePicStr,
  });

  //Uint8List customerProfilePicStr;
  String customerProfilePicStr;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    //customerProfilePicStr: base64.decode(json["CustomerProfilePicStr"]??""),
    customerProfilePicStr: json["CustomerProfilePicStr"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerProfilePicStr": customerProfilePicStr,
  };
}


















