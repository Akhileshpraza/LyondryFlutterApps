import 'dart:convert';

SelectStoreResponceModal selectStoreResponceModalFromJson(String str) => SelectStoreResponceModal.fromJson(json.decode(str));

String selectStoreResponceModalToJson(SelectStoreResponceModal data) => json.encode(data.toJson());

// List<SelectStoreResponceModal> selectStoreResponceModalFromJson(String str) => List<SelectStoreResponceModal>.from(json.decode(str));
// String selectStoreResponceModalToJson(List<SelectStoreResponceModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class SelectStoreResponceModal {
  SelectStoreResponceModal({
     this.success,
     this.storeList,
     this.error,
     this.errorMessage,
  });

  bool success;
  List<StoreList> storeList;
  bool error;
  String errorMessage;

  factory SelectStoreResponceModal.fromJson(Map<String, dynamic> json) => SelectStoreResponceModal(
    success: json["success"],
    storeList: List<StoreList>.from(json["StoreList"].map((x) => StoreList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "StoreList": List<dynamic>.from(storeList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class StoreList {
  StoreList({
     this.storeId,
     this.storeCompanyId,
     this.storeCode,
     this.storeName,
     this.storeAddress,
     this.storeEmailId,
     this.storePhone,
     this.storeLocation,
  });

  int storeId;
  int storeCompanyId;
  String storeCode;
  String storeName;
  String storeAddress;
  String storeEmailId;
  String storePhone;
  String storeLocation;

  factory StoreList.fromJson(Map<String, dynamic> json) => StoreList(
    storeId: json["StoreId"],
    storeCompanyId: json["StoreCompanyId"],
    storeCode: json["StoreCode"],
    storeName: json["StoreName"],
    storeAddress: json["StoreAddress"],
    storeEmailId: json["StoreEmailId"],
    storePhone: json["StorePhone"],
    storeLocation: json["StoreLocation"],
  );

  Map<String, dynamic> toJson() => {
    "StoreId": storeId,
    "StoreCompanyId": storeCompanyId,
    "StoreCode": storeCode,
    "StoreName": storeName,
    "StoreAddress": storeAddress,
    "StoreEmailId": storeEmailId,
    "StorePhone": storePhone,
    "StoreLocation": storeLocation,
  };
}
