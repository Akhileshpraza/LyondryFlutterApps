// To parse this JSON data, do
//
//     final selectTimeSlotResponceModal = selectTimeSlotResponceModalFromJson(jsonString);

import 'dart:convert';

SelectTimeSlotResponceModal selectTimeSlotResponceModalFromJson(String str) => SelectTimeSlotResponceModal.fromJson(json.decode(str));

String selectTimeSlotResponceModalToJson(SelectTimeSlotResponceModal data) => json.encode(data.toJson());

class SelectTimeSlotResponceModal {
  SelectTimeSlotResponceModal({
     this.success,
     this.timeSlotList,
     this.error,
     this.errorMessage,
  });

  bool success;
  List<TimeSlotList> timeSlotList;
  bool error;
  String errorMessage;

  factory SelectTimeSlotResponceModal.fromJson(Map<String, dynamic> json) => SelectTimeSlotResponceModal(
    success: json["success"],
    timeSlotList: List<TimeSlotList>.from(json["TimeSlotList"].map((x) => TimeSlotList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "TimeSlotList": List<dynamic>.from(timeSlotList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class TimeSlotList {
  TimeSlotList({
     this.timeSlotId,
     this.timeSlotStoreId,
     this.timeSlotValue,
  });

  int timeSlotId;
  int timeSlotStoreId;
  String timeSlotValue;

  factory TimeSlotList.fromJson(Map<String, dynamic> json) => TimeSlotList(
    timeSlotId: json["TimeSlotId"],
    timeSlotStoreId: json["TimeSlotStoreId"],
    timeSlotValue: json["TimeSlotValue"],
  );

  Map<String, dynamic> toJson() => {
    "TimeSlotId": timeSlotId,
    "TimeSlotStoreId": timeSlotStoreId,
    "TimeSlotValue": timeSlotValue,
  };
}
