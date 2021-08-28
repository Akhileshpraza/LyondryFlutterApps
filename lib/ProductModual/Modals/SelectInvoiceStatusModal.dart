
import 'dart:convert';

SelectInvoiceStatusModal selectInvoiceStatusModalFromJson(String str) => SelectInvoiceStatusModal.fromJson(json.decode(str));

String selectInvoiceStatusModalToJson(SelectInvoiceStatusModal data) => json.encode(data.toJson());

class SelectInvoiceStatusModal {
  SelectInvoiceStatusModal({
    this.success,
    this.invoiceList,
    this.error,
    this.errorMessage,
  });

  bool success;
  List<InvoiceList> invoiceList;
  bool error;
  String errorMessage;

  factory SelectInvoiceStatusModal.fromJson(Map<String, dynamic> json) => SelectInvoiceStatusModal(
    success: json["success"],
    invoiceList: List<InvoiceList>.from(json["invoiceList"].map((x) => InvoiceList.fromJson(x))),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "invoiceList": List<dynamic>.from(invoiceList.map((x) => x.toJson())),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class InvoiceList {
  InvoiceList({
    this.invoiceNo,
    this.invoiceDateString,
    this.invoiceTotalAmount,
    this.invoiceNetAmount,
    this.invoiceStatus,
    this.invoicePickupDate,
    this.invoiceStoreName,
    this.invoiceOrderId,
    this.invoiceCouponAmount,
    this.invoicePoints,
  });

  String invoiceNo;
  String invoiceDateString;
  double invoiceTotalAmount;
  double invoiceNetAmount;
  String invoiceStatus;
  String invoicePickupDate;
  String invoiceStoreName;
  int invoiceOrderId;
  double invoiceCouponAmount;
  int invoicePoints;

  factory InvoiceList.fromJson(Map<String, dynamic> json) => InvoiceList(
    invoiceNo: json["InvoiceNo"],
    invoiceDateString: json["InvoiceDateString"],
    invoiceTotalAmount: json["InvoiceTotalAmount"],
    invoiceNetAmount: json["InvoiceNetAmount"],
    invoiceStatus: json["InvoiceStatus"],
    invoicePickupDate: json["InvoicePickupDate"],
    invoiceStoreName: json["InvoiceStoreName"],
    invoiceOrderId: json["InvoiceOrderId"],
    invoiceCouponAmount: json["InvoiceCouponAmount"],
    invoicePoints: json["InvoicePoints"],
  );

  Map<String, dynamic> toJson() => {
    "InvoiceNo": invoiceNo,
    "InvoiceDateString": invoiceDateString,
    "InvoiceTotalAmount": invoiceTotalAmount,
    "InvoiceNetAmount": invoiceNetAmount,
    "InvoiceStatus": invoiceStatus,
    "InvoicePickupDate": invoicePickupDate,
    "InvoiceStoreName": invoiceStoreName,
    "InvoiceOrderId": invoiceOrderId,
    "InvoiceCouponAmount": invoiceCouponAmount,
    "InvoicePoints": invoicePoints,
  };
}
