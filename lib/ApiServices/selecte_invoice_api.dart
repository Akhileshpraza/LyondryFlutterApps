
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceResponceModal.dart';
import 'package:http/http.dart'as http;

class SelectInvoiceApi{

  SelectInvoiceResponceModal selectInvoiceResponceModal;

  var jsonString;
  Future<SelectInvoiceResponceModal> getSelectInvoice( String token,String mobileNo,int invoiceRequestId) async {
    try {
      var urlToken ={"Token" : token,"MobileNo": mobileNo,"InvoiceRequestId": invoiceRequestId.toString()};
      final response = await http.get(baseURL + "InvoiceApi/SelectInvoice", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return selectInvoiceResponceModalFromJson(jsonString);

      } else {
        print("else parts");
        return null;
      }
    } catch (e) {
      print(e.toString());
    }

    return selectInvoiceResponceModalFromJson(jsonString);
  }

}