import 'dart:convert';

GetSelectPickupCompletedModal getSelectPickupCompletedModalFromJson(String str) => GetSelectPickupCompletedModal.fromJson(json.decode(str));

String getSelectPickupCompletedModalToJson(GetSelectPickupCompletedModal data) => json.encode(data.toJson());

class GetSelectPickupCompletedModal {
  GetSelectPickupCompletedModal({
    this.success,
    this.deliveryDetailsList,
    this.error,
    this.errorMessage,
  });

  bool success;
  List<DeliveryDetailsList> deliveryDetailsList;
  bool error;
  String errorMessage;

  factory GetSelectPickupCompletedModal.fromJson(Map<String, dynamic> json) => GetSelectPickupCompletedModal(
    success: json["success"],
    deliveryDetailsList: List<DeliveryDetailsList>.from(json["DeliveryDetailsList"].map((x) => DeliveryDetailsList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "DeliveryDetailsList": List<dynamic>.from(deliveryDetailsList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class DeliveryDetailsList {
  DeliveryDetailsList({
    this.orderDetailsOrderCode,
    this.orderDetailsItemCode,
    this.orderDetailsItemName,
    this.orderDetailsTotalNo,
    this.orderDetailsServiceId,
    this.orderDetailsServiceType,
    this.orderDetailsPrice,
    this.orderDetailsDiscPercentage,
    this.orderDetailsTaxPercentage,
    this.orderDetailsTotalPrice,
    this.orderDetailsDiscount,
    this.orderDetailsTax,
    this.orderDetailsRemarks,
    this.orderDetailsRemarks2,
    this.orderDetailsSpecialInstruction,
    this.orderDetailsDeliveryPackType,
  });

  String orderDetailsOrderCode;
  String orderDetailsItemCode;
  String orderDetailsItemName;
  int orderDetailsTotalNo;
  int orderDetailsServiceId;
  String orderDetailsServiceType;
  double orderDetailsPrice;
  double orderDetailsDiscPercentage;
  double orderDetailsTaxPercentage;
  double orderDetailsTotalPrice;
  double orderDetailsDiscount;
  double orderDetailsTax;
  String orderDetailsRemarks;
  String orderDetailsRemarks2;
  String orderDetailsSpecialInstruction;
  String orderDetailsDeliveryPackType;

  factory DeliveryDetailsList.fromJson(Map<String, dynamic> json) => DeliveryDetailsList(
    orderDetailsOrderCode: json["OrderDetailsOrderCode"],
    orderDetailsItemCode: json["OrderDetailsItemCode"],
    orderDetailsItemName: json["OrderDetailsItemName"],
    orderDetailsTotalNo: json["OrderDetailsTotalNo"],
    orderDetailsServiceId: json["OrderDetailsServiceId"],
    orderDetailsServiceType: json["OrderDetailsServiceType"],
    orderDetailsPrice: json["OrderDetailsPrice"],
    orderDetailsDiscPercentage: json["OrderDetailsDiscPercentage"],
    orderDetailsTaxPercentage: json["OrderDetailsTaxPercentage"],
    orderDetailsTotalPrice: json["OrderDetailsTotalPrice"],
    orderDetailsDiscount: json["OrderDetailsDiscount"],
    orderDetailsTax: json["OrderDetailsTax"],
    orderDetailsRemarks: json["OrderDetailsRemarks"],
    orderDetailsRemarks2: json["OrderDetailsRemarks2"],
    orderDetailsSpecialInstruction: json["OrderDetailsSpecialInstruction"],
    orderDetailsDeliveryPackType: json["OrderDetailsDeliveryPackType"],
  );

  Map<String, dynamic> toJson() => {
    "OrderDetailsOrderCode": orderDetailsOrderCode,
    "OrderDetailsItemCode": orderDetailsItemCode,
    "OrderDetailsItemName": orderDetailsItemName,
    "OrderDetailsTotalNo": orderDetailsTotalNo,
    "OrderDetailsServiceId": orderDetailsServiceId,
    "OrderDetailsServiceType": orderDetailsServiceType,
    "OrderDetailsPrice": orderDetailsPrice,
    "OrderDetailsDiscPercentage": orderDetailsDiscPercentage,
    "OrderDetailsTaxPercentage": orderDetailsTaxPercentage,
    "OrderDetailsTotalPrice": orderDetailsTotalPrice,
    "OrderDetailsDiscount": orderDetailsDiscount,
    "OrderDetailsTax": orderDetailsTax,
    "OrderDetailsRemarks": orderDetailsRemarks,
    "OrderDetailsRemarks2": orderDetailsRemarks2,
    "OrderDetailsSpecialInstruction": orderDetailsSpecialInstruction,
    "OrderDetailsDeliveryPackType": orderDetailsDeliveryPackType,
  };
}
