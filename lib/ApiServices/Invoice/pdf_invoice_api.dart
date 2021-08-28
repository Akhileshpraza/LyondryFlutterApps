import 'dart:io';

import 'package:demogetx/ApiServices/Invoice/customer.dart';
import 'package:demogetx/ApiServices/Invoice/invoice.dart';
import 'package:demogetx/ApiServices/Invoice/pdf_api.dart';
import 'package:demogetx/ApiServices/Invoice/supplier.dart';
import 'package:demogetx/ApiServices/Invoice/terms_conditions.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 1 * PdfPageFormat.cm),
        buildInvoice(invoice),
        Divider(),
        buildMidTotalItems(invoice),
        Divider(),
        //buildInvoice1(invoice),
        buildMidlevel(invoice),
        buildBottomLevele(invoice),

      ],
      //footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'Tax-Invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         // SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSupplierAddress(invoice.supplier),

            ],
          ),
          Divider(),
          //SizedBox(height: 1 * PdfPageFormat.cm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildInvoiceInfo(invoice.info),
              //buildCustomerAddress(invoice.customer),
              buildInvoiceInfo1(invoice.info),

            ],
          ),
          Divider(),
        ],
      );

  static Widget buildMidTotalItems(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInvoiceTotalItems(invoice.termsConditionss),
          //buildCustomerAddress(invoice.customer),
          buildInvoiceTotalAmounts(invoice.termsConditionss),

        ],
      ),
     // Divider(),
    ],
  );


//**********midLevele*********************
  static Widget buildMidlevel(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      //SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInvoiceInfoMid(),
          //buildCustomerAddress(invoice.customer),
          buildInvoiceInfoMid1(invoice.termsConditionss),

        ],
      ),
      Divider(),


    ],
  );

//**********midLevele*********************

//**********header information*********************
  static Widget buildInvoiceInfo(InvoiceInfo info) {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Customer:',
      'Address:',
      'City:',
      'GSTIN/Unique ID:',
      'Contact No:',
      'E-Mail ID:',
    ];
    final data = <String>[
      info.customer,
      info.address,
      info.city,
      info.uinqueId,
      info.contactNo,
      info.emailId,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 270);
      }),
    );
  }
  static Widget buildInvoiceInfo1(InvoiceInfo info) {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'GST Invoice No:',
      'GST Invoice Date:',
      'Estimated Delivery Date:',
      'You have been serviced by:',

    ];
    final data = <String>[
      info.gstInvoiceNo,
      info.gstInvoiceDate,
      info.estimatedDeliveryDate,
      info.servicedBy,

    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildInvoiceTotalItems(TermsConditionss info) {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Total Items:',

    ];
    final data = <double>[
      info.invoiceNetAmount,

    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value.toString(), width: 200);
      }),
    );
  }
  static Widget buildInvoiceTotalAmounts(TermsConditionss info) {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Total Amount Before Tax:',

    ];
    final data = <double>[
      info.invoiceNetAmount,

    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value.toString(), width: 250);
      }),
    );
  }


  static Widget buildInvoiceInfoMid() {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Terms & Conditions :',
      '* LYONDRY Eco Carry Bags Are Chargeable *',
      'A) Kindly Preserve This Ticket Until Garments Are Delivered.',
      'B) Please Check All Your Garments At The Time Of Delivery.',
      'C) Bill Once Made Cannot Be Cancelled',
      'D) LYONDRY Does Not Guarantee Removal Of All Stains.',
      'E) Handloom Cottons/Silks & Dyed Fabrics May Change Colour Or Fade When Dry Cleaned.',
      'F) LYONDRY Reserves The Right To Refuse Cleaning Any Garment/Article.',
    ];

    return Column(

      children: List.generate(titles.length, (index) {
        final title = titles[index];
        //final value = data[0];

        return buildText(title: title, width: 280);
      }),
    );
  }
  static Widget buildInvoiceInfoMid1(TermsConditionss termsConditionss) {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    double igst =termsConditionss.invoiceIgst;
    //double totalTax =termsConditionss.invoiceTaxPercentage/2;
    double totalTax;
    if(igst==0){
      totalTax =termsConditionss.invoiceTaxPercentage/2;
    }
    else{
      totalTax=termsConditionss.invoiceTaxPercentage;
      igst =termsConditionss.invoiceTaxPercentage;
    }
    final titles = <String>[
      'Discount (${termsConditionss.invoiceDiscountPercentage}%)',
      'Total Amount After Discount',
      'Add Output CGST ($totalTax%)',
      'Add Output SGST ($totalTax%)',
      'Add Output IGST ($igst%)',
      'Tax Amount GST (${termsConditionss.invoiceTaxPercentage}%)',
      'Round Off (+/-)',
      'otal Amount After Tax',


    ];
    final data = <double>[
      termsConditionss.invoiceDiscountAmount,
      termsConditionss.invoiceDiscountAmount,
      termsConditionss.invoiceCgst,
      termsConditionss.invoiceSgst,
      termsConditionss.invoiceIgst,
      termsConditionss.invoiceTotalTax,
      termsConditionss.invoiceRoundOff,
      termsConditionss.invoiceTotalAmount

    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final double value = data[index];

        return buildText(title: title, value: value.toString(), width: 200);
      }),
    );
  }
//**********header information*********************

//*******************Header**********************
  static Widget buildSupplierAddress(Supplier supplier) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(supplier.title, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(supplier.subTitle, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(supplier.secondSubTitle, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(supplier.address),
          SizedBox(height: 1 * PdfPageFormat.mm),
          Text(supplier.subAddress),
          Text(supplier.name),
          Divider()
        ],
      );
  //*******************Header**********************



  //*******************invoiceBody********************
  static Widget buildInvoice(Invoice invoice) {
    final headers = [
      'SI. No',
      'Description',
      'HSN/SAC',
      'UOM',
      'Quantity',
      'Price',
      'Taxable Value'
    ];
    final data = invoice.items.map((item) {
      return [
        item.sNo,
        item.description,
        item.hsnsan,
        item.umo,
        item.quantity,
        item.price,
        item.taxableValue
      ];
    }
   ).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      tableWidth: TableWidth.max,

      //border: TableBorder(verticalInside: BorderSide(width: 1, style: BorderStyle.solid),horizontalInside: pw.BorderSide(width: 1,style: BorderStyle.solid)),
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,

      cellAlignments: {
        0: Alignment.topLeft,
        1: Alignment.topCenter,
        2: Alignment.topLeft,
        3: Alignment.topLeft,
        4: Alignment.topLeft,
        5: Alignment.topLeft,
        6: Alignment.topLeft,
      },
    );
  }

  // static Widget buildInvoice1(Invoice invoice) {
  //   final headers = [
  //     'Total Items : 12',
  //     'Total Amount Before Tax : 1,120.00',
  //
  //   ];
  //   final data1 = invoice.termsConditions?.map((items) {
  //     return [
  //        items.termCondition,
  //        items.totalAmount,
  //
  //     ];
  //   }
  //   )?.toList()??[];
  //
  //   return Table.fromTextArray(
  //     headers: headers,
  //     data: data1,
  //     tableWidth: TableWidth.max,
  //
  //     border: TableBorder(verticalInside: BorderSide(width: 1, style: BorderStyle.solid),horizontalInside: pw.BorderSide(width: 1,style: BorderStyle.solid)),
  //     headerStyle: TextStyle(fontWeight: FontWeight.bold),
  //
  //     cellHeight: 25,
  //     cellAlignments: {
  //       0: Alignment.center,
  //       1: Alignment.center,
  //
  //     },
  //   );
  // }
  //


  //**********bottomLevele*********************
  static Widget buildBottomLevele(Invoice invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      SizedBox(height: 1 * PdfPageFormat.cm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildInvoiceInfoBottomLevel(),
          //buildCustomerAddress(invoice.customer),
          //buildInvoiceInfoMid1(invoice.termsConditionss),

        ],
      ),
      Divider(),


    ],
  );
  static Widget buildInvoiceInfoBottomLevel() {
    //final paymentTerms = '${info.dueDate.difference(info.date).inDays} days';
    final titles = <String>[
      'Terms & Conditions :',
      '1) Quality of texture, colour, trimmings, etc. is entirely at owners risk',
      '2) The Company does not hold itself responsible for delay loss or damage to any article arising from unforeseen circumstances or from causes beyond control. ',
      '3) In the event of damage to article that is not caused by any of the above stated characteristics. LYONDRY liability is limited to six (6) times the cleaning charge of the damaged article.',
      '4) Any difference in the count of items and the number of items on the bill must be reported at the time of delivery only. LYONDRY will not be responsible once the garments are out of the store .',
      '5) In the unforeseen events of loss or misplacement of any article, LYONDRY shall conduct careful examination of the specific case. LYONDRY liability with respect to any lost item shall not exceed ten (10) times of charges for cleaning ofarticle after as ',
      'billed. ',
      '* Thank You For Visiting... Please Come Again...*            Customer Signature',
    ];

    return Column(

      children: List.generate(titles.length, (index) {
        final title = titles[index];

        return buildText(title: title, width: 500);
      }),
    );
  }
  //**********bottomLevele*********************


  //****************************footer parts********************
  static Widget buildCustomerAddress(Customer customer) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(customer.name, style: TextStyle(fontWeight: FontWeight.bold)),
      Text(customer.address),
    ],
  );
  static Widget buildFooter(Invoice invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(title: 'Address', value: invoice.supplier.address),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(title: 'Paypal', value: invoice.supplier.title),
        ],
      );
  //****************************footer parts********************
  static buildSimpleText({
   String title,
    String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    String title,
    String value,
    double width = double.infinity,
    TextStyle titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
