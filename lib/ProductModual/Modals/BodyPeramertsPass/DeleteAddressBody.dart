
import 'dart:convert';

DeleteAddressBody deleteAddressBodyFromJson(String str) => DeleteAddressBody.fromJson(json.decode(str));

String deleteAddressBodyToJson(DeleteAddressBody data) => json.encode(data.toJson());

class DeleteAddressBody {
  DeleteAddressBody({
    this.customerMobileNo,
    this.customerAddressList,
  });

  String customerMobileNo;
  String customerAddressList;

  factory DeleteAddressBody.fromJson(Map<String, dynamic> json) => DeleteAddressBody(
    customerMobileNo: json["CustomerMobileNo"],
    //customerAddressList: List<CustomerAddressList>.from(json["CustomerAddressList"].map((x) => CustomerAddressList.fromJson(x))),
      customerAddressList: json["customerAddressList"]
  );

  Map<String, dynamic> toJson() => {
    "CustomerMobileNo": customerMobileNo,
    "CustomerAddressList": customerAddressList
    //"CustomerAddressList": List<dynamic>.from(customerAddressList.map((x) => x.toJson())),
  };
}

class CustomerAddressList {
  CustomerAddressList({
    this.addressId,
    this.addressCustomerId,
  });

  String addressId;
  String addressCustomerId;

  factory CustomerAddressList.fromJson(Map<String, dynamic> json) => CustomerAddressList(
    addressId: json["AddressId"],
    addressCustomerId: json["AddressCustomerId"],
  );

  Map<String, dynamic> toJson() => {
    "AddressId": addressId,
    "AddressCustomerId": addressCustomerId,
  };
}
