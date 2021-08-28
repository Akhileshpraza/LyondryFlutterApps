
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceStatusModal.dart';
import 'package:http/http.dart' as http;

class SelectInvoiceStatusAPI{

  SelectInvoiceStatusModal selectInvoiceStatusModal;

  var jsonString;
  Future<SelectInvoiceStatusModal> getSelectedInvoiceStatus( String token,String mobileNo) async {
    try {
      var urlToken ={'Token' : token,'MobileNo': mobileNo};
      final response = await http.post(baseURL + "InvoiceApi/SelectInvoiceStatus", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return selectInvoiceStatusModalFromJson(jsonString);

      } else {
        print("else parts");

        return null;
      }
    } catch (e) {
      print(e.toString());

    }
    return selectInvoiceStatusModalFromJson(jsonString);
  }

}