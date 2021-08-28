
import 'dart:convert';

UpdateAddressBodyModal updateAddressBodyModalFromJson(String str) => UpdateAddressBodyModal.fromJson(json.decode(str));

String updateAddressBodyModalToJson(UpdateAddressBodyModal data) => json.encode(data.toJson());

class UpdateAddressBodyModal {
  UpdateAddressBodyModal({
    this.customerMobileNo,
    this.customerAddressList,
  });

  String customerMobileNo;
  String customerAddressList;

  factory UpdateAddressBodyModal.fromJson(Map<String, dynamic> json) => UpdateAddressBodyModal(
    customerMobileNo: json["CustomerMobileNo"],
    //customerAddressList: List<CustomerAddressList>.from(json["CustomerAddressList"].map((x) => CustomerAddressList.fromJson(x))),
    customerAddressList: json["customerAddressList"],
  );

  Map<String, dynamic> toJson() => {
    "CustomerMobileNo": customerMobileNo,
    "CustomerAddressList": customerAddressList,
    //"CustomerAddressList": List<dynamic>.from(customerAddressList.map((x) => x.toJson())),
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
    this.entryStatus,
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
  String entryStatus;

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
    entryStatus: json["EntryStatus"],
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
    "EntryStatus": entryStatus,
  };
}
