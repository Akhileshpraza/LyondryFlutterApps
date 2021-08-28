// To parse this JSON data, do
//
//     final getSelecteOrderModal = getSelecteOrderModalFromJson(jsonString);

import 'dart:convert';

GetSelecteOrderModal getSelecteOrderModalFromJson(String str) => GetSelecteOrderModal.fromJson(json.decode(str));

String getSelecteOrderModalToJson(GetSelecteOrderModal data) => json.encode(data.toJson());

class GetSelecteOrderModal {
  GetSelecteOrderModal({
    this.success,
    this.pickupRequestList,
    this.error,
    this.errorMessage,
  });

  bool success;
  List<PickupRequestList> pickupRequestList;
  bool error;
  String errorMessage;

  factory GetSelecteOrderModal.fromJson(Map<String, dynamic> json) => GetSelecteOrderModal(
    success: json["success"],
    pickupRequestList: List<PickupRequestList>.from(json["PickupRequestList"].map((x) => PickupRequestList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "PickupRequestList": List<dynamic>.from(pickupRequestList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class PickupRequestList {
  PickupRequestList({
    this.pickupRequestId,
    this.pickupRequestDate,
    this.pickupRequestStatus,
  });

  int pickupRequestId;
  String pickupRequestDate;
  String pickupRequestStatus;

  factory PickupRequestList.fromJson(Map<String, dynamic> json) => PickupRequestList(
    pickupRequestId: json["PickupRequestId"],
    pickupRequestDate: json["PickupRequestDate"],
    pickupRequestStatus: json["PickupRequestStatus"],
  );

  Map<String, dynamic> toJson() => {
    "PickupRequestId": pickupRequestId,
    "PickupRequestDate": pickupRequestDate,
    "PickupRequestStatus": pickupRequestStatus,
  };
}
