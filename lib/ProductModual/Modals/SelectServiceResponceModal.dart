import 'dart:convert';

import 'dart:typed_data';


SelectServiceResponceModal selectServiceResponceModalFromJson(String str) => SelectServiceResponceModal.fromJson(json.decode(str));

String selectServiceResponceModalToJson(SelectServiceResponceModal data) => json.encode(data.toJson());

class SelectServiceResponceModal {
  SelectServiceResponceModal({
     this.success,
     this.serviceList,
     this.error,
     this.errorMessage,
  });

  bool success;
  List<ServiceList> serviceList;
  bool error;
  String errorMessage;
  //
  // var isFavorite = false.obs;

  factory SelectServiceResponceModal.fromJson(Map<String, dynamic> json) => SelectServiceResponceModal(
    success: json["success"],
    serviceList: List<ServiceList>.from(json["ServiceList"].map((x) => ServiceList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "ServiceList": List<dynamic>.from(serviceList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class ServiceList {
  ServiceList({
     this.serviceId,
     this.serviceName,
     this.serviceIcon,
  });

  int serviceId;
  String serviceName;
  Uint8List  serviceIcon;

  factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
    serviceId: json["ServiceId"],
    serviceName: json["ServiceName"]??"",
    serviceIcon:  base64.decode(json["ServiceIcon"]??"")
  );

  Map<String, dynamic> toJson() => {
    "ServiceId": serviceId,
    "ServiceName": serviceName,
    "ServiceIcon": serviceIcon,
  };
}
