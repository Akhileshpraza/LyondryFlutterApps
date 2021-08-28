import 'dart:convert';

InsertPickupResponceModal insertPickupResponceModalFromJson(String str) => InsertPickupResponceModal.fromJson(json.decode(str));

String insertPickupResponceModalToJson(InsertPickupResponceModal data) => json.encode(data.toJson());

class InsertPickupResponceModal {
  InsertPickupResponceModal({
     this.success,
     this.data,
     this.error,
     this.errorMessage,
  });

  bool success;
  Data data;
  String error;
  String errorMessage;

  factory InsertPickupResponceModal.fromJson(Map<String, dynamic> json) => InsertPickupResponceModal(
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
     this.pickupRequestId,
     this.pickupRequestServiceName,
     this.pickupRequestStoreName,
     this.pickupRequestServiceType,
     this.pickupRequestDate,
     this.pickupRequestTime,
     this.pickupRequestAddress,
     this.pickupRequestStatus,
  });

  int pickupRequestId;
  String pickupRequestServiceName;
  String pickupRequestStoreName;
  String pickupRequestServiceType;
  String pickupRequestDate;
  String pickupRequestTime;
  String pickupRequestAddress;
  String pickupRequestStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pickupRequestId: json["PickupRequestId"],
    pickupRequestServiceName: json["PickupRequestServiceName"],
    pickupRequestStoreName: json["PickupRequestStoreName"],
    pickupRequestServiceType: json["PickupRequestServiceType"],
    pickupRequestDate: json["PickupRequestDate"],
    pickupRequestTime: json["PickupRequestTime"],
    pickupRequestAddress: json["PickupRequestAddress"],
    pickupRequestStatus: json["PickupRequestStatus"],
  );

  Map<String, dynamic> toJson() => {
    "PickupRequestId": pickupRequestId,
    "PickupRequestServiceName": pickupRequestServiceName,
    "PickupRequestStoreName": pickupRequestStoreName,
    "PickupRequestServiceType": pickupRequestServiceType,
    "PickupRequestDate": pickupRequestDate,
    "PickupRequestTime": pickupRequestTime,
    "PickupRequestAddress": pickupRequestAddress,
    "PickupRequestStatus": pickupRequestStatus,
  };
}
