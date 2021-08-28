// To parse this JSON data, do
//
//     final orderTrakingModal = orderTrakingModalFromJson(jsonString);

import 'dart:convert';

OrderTrakingModal orderTrakingModalFromJson(String str) => OrderTrakingModal.fromJson(json.decode(str));

String orderTrakingModalToJson(OrderTrakingModal data) => json.encode(data.toJson());

class OrderTrakingModal {
  OrderTrakingModal({
    this.success,
    this.orderTrackingList,
    this.error,
    this.errorMessage,
  });

  bool success;
  List<OrderTrackingList> orderTrackingList;
  bool error;
  String errorMessage;

  factory OrderTrakingModal.fromJson(Map<String, dynamic> json) => OrderTrakingModal(
    success: json["success"],
    orderTrackingList: List<OrderTrackingList>.from(json["OrderTrackingList"].map((x) => OrderTrackingList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "OrderTrackingList": List<dynamic>.from(orderTrackingList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class OrderTrackingList {
  OrderTrackingList({
    this.trackingCustomerId,
    this.trackingId,
    this.trackingSerialNo,
    this.trackingStatus,
    this.trackingPickupBy,
    this.trackingDeliveredBy,
    this.trackingDate,
    this.trackingTime,
    this.error,
    this.errorMessage,
  });

  int trackingCustomerId;
  int trackingId;
  int trackingSerialNo;
  String trackingStatus;
  String trackingPickupBy;
  String trackingDeliveredBy;
  String trackingDate;
  String trackingTime;
  String error;
  String errorMessage;

  factory OrderTrackingList.fromJson(Map<String, dynamic> json) => OrderTrackingList(
    trackingCustomerId: json["TrackingCustomerId"],
    trackingId: json["TrackingId"],
    trackingSerialNo: json["TrackingSerialNo"],
    trackingStatus: json["TrackingStatus"],
    trackingPickupBy: json["TrackingPickupBy"],
    trackingDeliveredBy: json["TrackingDeliveredBy"],
    trackingDate: json["TrackingDate"],
    trackingTime: json["TrackingTime"],
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  //get orderTrakingLists => null;

  Map<String, dynamic> toJson() => {
    "TrackingCustomerId": trackingCustomerId,
    "TrackingId": trackingId,
    "TrackingSerialNo": trackingSerialNo,
    "TrackingStatus": trackingStatus,
    "TrackingPickupBy": trackingPickupBy,
    "TrackingDeliveredBy": trackingDeliveredBy,
    "TrackingDate": trackingDate,
    "TrackingTime": trackingTime,
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}
