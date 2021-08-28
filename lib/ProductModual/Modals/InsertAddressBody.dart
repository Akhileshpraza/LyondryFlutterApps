// To parse this JSON data, do
//
//     final insertAddressBody = insertAddressBodyFromJson(jsonString);

import 'dart:convert';

InsertAddressBody insertAddressBodyFromJson(String str) => InsertAddressBody.fromJson(json.decode(str));

String insertAddressBodyToJson(InsertAddressBody data) => json.encode(data.toJson());

class InsertAddressBody {
  InsertAddressBody({
    this.customerMobileNo,
    this.customerAddress,
  });

  String customerMobileNo;
  String customerAddress;
  //List<CustomerAddressList> customerAddressList;

  factory InsertAddressBody.fromJson(Map<String, dynamic> json) => InsertAddressBody(
    customerMobileNo: json["CustomerMobileNo"],
    //customerAddressList: List<CustomerAddressList>.from(json["CustomerAddressList"].map((x) => CustomerAddressList.fromJson(x))),
      customerAddress:  json["customerAddress"]
  );

  Map<String, dynamic> toJson() => {
    "CustomerMobileNo": customerMobileNo,
    "customerAddress": customerAddress
  };
}

class customerAddress {
  customerAddress({
    this.addressCustomerId,
    this.addressBuildingNoHouseName,
    this.addressStreet,
    this.addressCity,
    this.addressPin,
    this.addressLandmark,
    this.addressLocationLaLo,
    this.addressType,
    this.addressDefault,
    this.addressActive,
    this.entryStatus,
  });


  int addressCustomerId;
  String addressBuildingNoHouseName;
  String addressStreet;
  String addressCity;
  String addressPin;
  String addressLandmark;
  String addressLocationLaLo;
  String addressType;
  String addressDefault;
  String addressActive;
  String entryStatus;

  factory customerAddress.fromJson(Map<String, dynamic> json) => customerAddress(
    addressCustomerId: json["AddressCustomerId"],
    addressBuildingNoHouseName: json["AddressBuildingNoHouseName"],
    addressStreet: json["AddressStreet"],
    addressCity: json["AddressCity"],
    addressPin: json["AddressPin"],
    addressLandmark: json["AddressLandmark"],
    addressLocationLaLo: json["AddressLocationLaLo"],
    addressType: json["AddressType"],
    addressDefault: json["AddressDefault"],
    addressActive: json["AddressActive"],
    entryStatus: json["EntryStatus"],
  );

  Map<String, dynamic> toJson() => {
    "AddressCustomerId": addressCustomerId,
    "AddressBuildingNoHouseName": addressBuildingNoHouseName,
    "AddressStreet": addressStreet,
    "AddressCity": addressCity,
    "AddressPin": addressPin,
    "AddressLandmark": addressLandmark,
    "AddressLocationLaLo": addressLocationLaLo,
    "AddressType": addressType,
    "AddressDefault": addressDefault,
    "AddressActive": addressActive,
    "EntryStatus": entryStatus,
  };
}
