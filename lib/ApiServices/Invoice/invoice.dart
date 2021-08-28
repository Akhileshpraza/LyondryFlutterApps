import 'package:demogetx/ApiServices/Invoice/customer.dart';
import 'package:demogetx/ApiServices/Invoice/supplier.dart';
import 'package:demogetx/ApiServices/Invoice/terms_conditions.dart';


class Invoice {
  final InvoiceInfo info;
  final Supplier supplier;
  final Customer customer;
  final List<InvoiceItem> items;
  final TermsConditionss termsConditionss;
  final List<TermsConditions> termsConditions;

  const Invoice({
     this.info,
     this.supplier,
     this.customer,
     this.items,
    this.termsConditions,
    this.termsConditionss
  });
}

class TermsConditions {
  final String termCondition;
  final String totalAmount;

  TermsConditions(this.termCondition,
      this.totalAmount);

}


class InvoiceInfo {
  final String customer;
  final String address;
  final String city;
  final String uinqueId;
  final String contactNo;
  final String emailId;
  final String gstInvoiceNo;
  final String gstInvoiceDate;
  final String estimatedDeliveryDate;
  final String servicedBy;

  const InvoiceInfo({
    this.customer,
    this.address,
    this.city,
    this.uinqueId,
    this.contactNo,
    this.emailId,
    this.gstInvoiceNo,
    this.gstInvoiceDate,
    this.estimatedDeliveryDate,
    this.servicedBy
  });
}

class InvoiceItem {
  final int sNo;
  final String description;
  final String hsnsan;
  final String umo;
  final double quantity;
  final double price;
  final double taxableValue;
  // final String termCondition;
  // final String totalAmount;

  const InvoiceItem( {
    this.sNo,
      this.description,
      this.hsnsan,
      this.umo,
      this.quantity,
      this.price,
      this.taxableValue,
      // this.termCondition,
      // this.totalAmount,

  });
}
