import 'dart:convert';

GetSelectOrderImagesModal getSelectOrderImagesModalFromJson(String str) => GetSelectOrderImagesModal.fromJson(json.decode(str));

String getSelectOrderImagesModalToJson(GetSelectOrderImagesModal data) => json.encode(data.toJson());

class GetSelectOrderImagesModal {
  GetSelectOrderImagesModal({
    this.success,
    this.orderImagesList,
    this.error,
    this.errorMessage,
  });

  bool success;
  List<OrderImagesList> orderImagesList;
  String error;
  String errorMessage;

  factory GetSelectOrderImagesModal.fromJson(Map<String, dynamic> json) => GetSelectOrderImagesModal(
    success: json["success"],
    orderImagesList: List<OrderImagesList>.from(json["orderImagesList"].map((x) => OrderImagesList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "orderImagesList": List<dynamic>.from(orderImagesList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class OrderImagesList {
  OrderImagesList({
    this.orderImageString,
  });

  String orderImageString;

  factory OrderImagesList.fromJson(Map<String, dynamic> json) => OrderImagesList(
    orderImageString: json["OrderImageString"],
  );

  Map<String, dynamic> toJson() => {
    "OrderImageString": orderImageString,
  };
}
