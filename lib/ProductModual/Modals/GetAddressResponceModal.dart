import 'dart:convert';

GetAddressResponceModal getAddressResponceModalFromJson(String str) => GetAddressResponceModal.fromJson(json.decode(str));

String getAddressResponceModalToJson(GetAddressResponceModal data) => json.encode(data.toJson());

class GetAddressResponceModal {
  GetAddressResponceModal({
     this.success,
     this.customerAddressList,
     this.error,
     this.errorMessage,
  });

  bool success;
  List<CustomerAddressList> customerAddressList;
  bool error;
  String errorMessage;

  factory GetAddressResponceModal.fromJson(Map<String, dynamic> json) => GetAddressResponceModal(
    success: json["success"],
    customerAddressList: List<CustomerAddressList>.from(json["CustomerAddressList"].map((x) => CustomerAddressList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "CustomerAddressList": List<dynamic>.from(customerAddressList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class CustomerAddressList {
  CustomerAddressList({
     this.addressId,
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
     this.sessionId,
     this.dateTime,
     this.entryStatus,
     this.error,
     this.errorMessage,
    this.isSelected=false,
    this.addressCustomerIdSelected= 0,
  });

  int addressId;
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
  String sessionId;
  DateTime dateTime;
  String entryStatus;
  String error;
  String errorMessage;
  bool isSelected;
  int addressCustomerIdSelected;

  factory CustomerAddressList.fromJson(Map<String, dynamic> json) => CustomerAddressList(
    addressId: json["AddressId"],
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
    sessionId: json["SessionID"],
    dateTime: DateTime.parse(json["DateTime"]),
    entryStatus: json["EntryStatus"],
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "AddressId": addressId,
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
    "SessionID": sessionId,
    "DateTime": dateTime.toIso8601String(),
    "EntryStatus": entryStatus,
    "Error": error,
    "ErrorMessage": errorMessage,

  };
}
