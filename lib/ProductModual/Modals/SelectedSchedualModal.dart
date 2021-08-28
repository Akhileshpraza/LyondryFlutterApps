// To parse this JSON data, do
//
//     final selectedSchedualModal = selectedSchedualModalFromJson(jsonString);

import 'dart:convert';

SelectedSchedualModal selectedSchedualModalFromJson(String str) => SelectedSchedualModal.fromJson(json.decode(str));

String selectedSchedualModalToJson(SelectedSchedualModal data) => json.encode(data.toJson());

class SelectedSchedualModal {
  SelectedSchedualModal({
    this.success,
    this.pickupScheduleList,
    this.error,
    this.errorMessage,
  });

  bool success;
  List<PickupScheduleList> pickupScheduleList;
  dynamic error;
  dynamic errorMessage;

  factory SelectedSchedualModal.fromJson(Map<String, dynamic> json) => SelectedSchedualModal(
    success: json["success"],
    pickupScheduleList: List<PickupScheduleList>.from(json["PickupScheduleList"].map((x) => PickupScheduleList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "PickupScheduleList": List<dynamic>.from(pickupScheduleList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class PickupScheduleList {
  PickupScheduleList({
    this.pickupSchedulePickupRequestId,
    this.pickupStatusName,
    this.pickupByName,
    this.pickupByMobile,
    this.invoiceNo,
    this.totalAmount,
    this.paymentStatus,
    this.storeName,
  });

  int pickupSchedulePickupRequestId;
  String pickupStatusName;
  String pickupByName;
  String pickupByMobile;
  String invoiceNo;
  double totalAmount;
  String paymentStatus;
  String storeName;

  factory PickupScheduleList.fromJson(Map<String, dynamic> json) => PickupScheduleList(
    pickupSchedulePickupRequestId: json["PickupSchedulePickupRequestId"],
    pickupStatusName: json["PickupStatusName"],
    pickupByName: json["PickupByName"],
    pickupByMobile: json["PickupByMobile"],
    invoiceNo: json["InvoiceNo"],
    totalAmount: json["TotalAmount"],
    paymentStatus: json["PaymentStatus"],
    storeName: json["StoreName"],
  );

  Map<String, dynamic> toJson() => {
    "PickupSchedulePickupRequestId": pickupSchedulePickupRequestId,
    "PickupStatusName": pickupStatusName,
    "PickupByName": pickupByName,
    "PickupByMobile": pickupByMobile,
    "InvoiceNo": invoiceNo,
    "TotalAmount": totalAmount,
    "PaymentStatus": paymentStatus,
    "StoreName": storeName,
  };
}
