import 'dart:convert';

SelectInvoiceResponceModal selectInvoiceResponceModalFromJson(String str) => SelectInvoiceResponceModal.fromJson(json.decode(str));
String selectInvoiceResponceModalToJson(SelectInvoiceResponceModal data) => json.encode(data.toJson());

class SelectInvoiceResponceModal {
  SelectInvoiceResponceModal({
     this.success,
     this.invoiceMaster,
     this.error,
     this.errorMessage,
  });

  bool success;
  InvoiceMaster invoiceMaster;
  bool error;
  String errorMessage;

  factory SelectInvoiceResponceModal.fromJson(Map<String, dynamic> json) => SelectInvoiceResponceModal(
    success: json["success"],
    invoiceMaster: InvoiceMaster.fromJson(json["invoiceMaster"]),
    error: json["Error"],
    errorMessage: json["ErrorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "invoiceMaster": invoiceMaster.toJson(),
    "Error": error,
    "ErrorMessage": errorMessage,
  };
}

class InvoiceMaster {
  InvoiceMaster({
     this.invoiceNo,
     this.invoiceDateString,
     this.invoiceDueDate,
     this.invoiceCustomerId,
     this.invoiceCustomerCode,
     this.invoiceCustomerMobileNo,
     this.invoiceCustomerAddress,
     this.invoiceCustomerGstNo,
     this.invoiceRequestId,
     this.invoiceOrderNo,
     this.invoiceTotalAmount,
     this.invoiceDiscountPercentage,
     this.invoiceDiscountAmount,
     this.invoiceTaxPercentage,
     this.invoiceCgst,
     this.invoiceSgst,
     this.invoiceIgst,
     this.invoiceTotalTax,
     this.invoiceRoundOff,
     this.invoiceNetAmount,
     this.invoicePickupBy,
     this.gridTrans,
  });

  String invoiceNo;
  String invoiceDateString;
  String invoiceDueDate;
  int invoiceCustomerId;
  String invoiceCustomerCode;
  String invoiceCustomerMobileNo;
  String invoiceCustomerAddress;
  String invoiceCustomerGstNo;
  int invoiceRequestId;
  String invoiceOrderNo;
  double invoiceTotalAmount;
  double invoiceDiscountPercentage;
  double invoiceDiscountAmount;
  double invoiceTaxPercentage;
  double invoiceCgst;
  double invoiceSgst;
  double invoiceIgst;
  double invoiceTotalTax;
  double invoiceRoundOff;
  double invoiceNetAmount;
  String invoicePickupBy;
  List<GridTran> gridTrans;

  factory InvoiceMaster.fromJson(Map<String, dynamic> json) => InvoiceMaster(
    invoiceNo: json["InvoiceNo"],
    invoiceDateString: json["InvoiceDateString"],
    invoiceDueDate: json["InvoiceDueDate"],
    invoiceCustomerId: json["InvoiceCustomerId"],
    invoiceCustomerCode: json["InvoiceCustomerCode"],
    invoiceCustomerMobileNo: json["InvoiceCustomerMobileNo"],
    invoiceCustomerAddress: json["InvoiceCustomerAddress"],
    invoiceCustomerGstNo: json["InvoiceCustomerGstNo"],
    invoiceRequestId: json["InvoiceRequestId"],
    invoiceOrderNo: json["InvoiceOrderNo"],
    invoiceTotalAmount: json["InvoiceTotalAmount"],
    invoiceDiscountPercentage: json["InvoiceDiscountPercentage"],
    invoiceDiscountAmount: json["InvoiceDiscountAmount"],
    invoiceTaxPercentage: json["InvoiceTaxPercentage"],
    invoiceCgst: json["InvoiceCgst"],
    invoiceSgst: json["InvoiceSgst"],
    invoiceIgst: json["InvoiceIgst"],
    invoiceTotalTax: json["InvoiceTotalTax"],
    invoiceRoundOff: json["InvoiceRoundOff"],
    invoiceNetAmount: json["InvoiceNetAmount"],
    invoicePickupBy: json["InvoicePickupBy"],
    gridTrans: List<GridTran>.from(json["GridTrans"].map((x) => GridTran.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "InvoiceNo": invoiceNo,
    "InvoiceDateString": invoiceDateString,
    "InvoiceDueDate": invoiceDueDate,
    "InvoiceCustomerId": invoiceCustomerId,
    "InvoiceCustomerCode": invoiceCustomerCode,
    "InvoiceCustomerMobileNo": invoiceCustomerMobileNo,
    "InvoiceCustomerAddress": invoiceCustomerAddress,
    "InvoiceCustomerGstNo": invoiceCustomerGstNo,
    "InvoiceRequestId": invoiceRequestId,
    "InvoiceOrderNo": invoiceOrderNo,
    "InvoiceTotalAmount": invoiceTotalAmount,
    "InvoiceDiscountPercentage": invoiceDiscountPercentage,
    "InvoiceDiscountAmount": invoiceDiscountAmount,
    "InvoiceTaxPercentage": invoiceTaxPercentage,
    "InvoiceCgst": invoiceCgst,
    "InvoiceSgst": invoiceSgst,
    "InvoiceIgst": invoiceIgst,
    "InvoiceTotalTax": invoiceTotalTax,
    "InvoiceRoundOff": invoiceRoundOff,
    "InvoiceNetAmount": invoiceNetAmount,
    "InvoicePickupBy": invoicePickupBy,
    "GridTrans": List<dynamic>.from(gridTrans.map((x) => x.toJson())),
  };
}

class GridTran {
  GridTran({
     this.invoiceTranInvoiceNo,
     this.invoiceTranSlNo,
     this.invoiceTranItemCode,
     this.invoiceTranDescription,
     this.invoiceTranUom,
     this.invoiceTranHsnsac,
     this.invoiceTranItemUnitPrice,
     this.invoiceTranItemUomId,
     this.invoiceTranItemNos,
     this.invoiceTranAmount,
     this.invoiceTranDiscPercentage,
     this.invoiceTranDiscount,
     this.invoiceTranTaxPercentage,
     this.invoiceTranCgst,
     this.invoiceTranSgst,
     this.invoiceTranIgst,
     this.invoiceTranTotalTax,
     this.invoiceTranNetAmount,
     this.isChecked

  });

  String invoiceTranInvoiceNo;
  int invoiceTranSlNo;
  String invoiceTranItemCode;
  String invoiceTranDescription;
  String invoiceTranUom;
  String invoiceTranHsnsac;
  double invoiceTranItemUnitPrice;
  double invoiceTranItemUomId;
  double invoiceTranItemNos;
  double invoiceTranAmount;
  double invoiceTranDiscPercentage;
  double invoiceTranDiscount;
  double invoiceTranTaxPercentage;
  double invoiceTranCgst;
  double invoiceTranSgst;
  double invoiceTranIgst;
  double invoiceTranTotalTax;
  double invoiceTranNetAmount;
  bool isChecked =false;

  factory GridTran.fromJson(Map<String, dynamic> json) => GridTran(
    invoiceTranInvoiceNo: json["InvoiceTranInvoiceNo"],
    invoiceTranSlNo: json["InvoiceTranSlNo"],
    invoiceTranItemCode: json["InvoiceTranItemCode"],
    invoiceTranDescription: json["InvoiceTranDescription"],
    invoiceTranUom: json["InvoiceTranUOM"],
    invoiceTranHsnsac: json["InvoiceTranHSNSAC"],
    invoiceTranItemUnitPrice: json["InvoiceTranItemUnitPrice"],
    invoiceTranItemUomId: json["InvoiceTranItemUomId"],
    invoiceTranItemNos: json["InvoiceTranItemNos"],
    invoiceTranAmount: json["InvoiceTranAmount"],
    invoiceTranDiscPercentage: json["InvoiceTranDiscPercentage"],
    invoiceTranDiscount: json["InvoiceTranDiscount"],
    invoiceTranTaxPercentage: json["InvoiceTranTaxPercentage"],
    invoiceTranCgst: json["InvoiceTranCgst"],
    invoiceTranSgst: json["InvoiceTranSgst"],
    invoiceTranIgst: json["InvoiceTranIgst"],
    invoiceTranTotalTax: json["InvoiceTranTotalTax"],
    invoiceTranNetAmount: json["InvoiceTranNetAmount"],
  );

  Map<String, dynamic> toJson() => {
    "InvoiceTranInvoiceNo": invoiceTranInvoiceNo,
    "InvoiceTranSlNo": invoiceTranSlNo,
    "InvoiceTranItemCode": invoiceTranItemCode,
    "InvoiceTranDescription": invoiceTranDescription,
    "InvoiceTranUOM": invoiceTranUom,
    "InvoiceTranHSNSAC": invoiceTranHsnsac,
    "InvoiceTranItemUnitPrice": invoiceTranItemUnitPrice,
    "InvoiceTranItemUomId": invoiceTranItemUomId,
    "InvoiceTranItemNos": invoiceTranItemNos,
    "InvoiceTranAmount": invoiceTranAmount,
    "InvoiceTranDiscPercentage": invoiceTranDiscPercentage,
    "InvoiceTranDiscount": invoiceTranDiscount,
    "InvoiceTranTaxPercentage": invoiceTranTaxPercentage,
    "InvoiceTranCgst": invoiceTranCgst,
    "InvoiceTranSgst": invoiceTranSgst,
    "InvoiceTranIgst": invoiceTranIgst,
    "InvoiceTranTotalTax": invoiceTranTotalTax,
    "InvoiceTranNetAmount": invoiceTranNetAmount,
  };
}
