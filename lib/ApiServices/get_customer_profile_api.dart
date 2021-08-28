
import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/GetCustomerProfileResponceModal.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'apis.dart';
class GetCustomerProfileApi{

  GetCustomerProfileResponceModal getCustomerProfile_responce_modal;
  var logger =Logger();
  bool isLoading = false;


  var jsonString;
  Future<GetCustomerProfileResponceModal> getCustomerProfile( String token,String mobileNo) async {
    try {
      var urlToken ={"Token" : token,"MobileNo": mobileNo};
      final response = await http.get(baseURL + "CustomerUpdateApi/GetCustomerProfile", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getCustomerProfileResponceModalFromJson(jsonString);

      } else {
        print("else parts");
        //logger.d('else part');
        //logger.d(getCustomerProfile_responce_modal.data);
        return null;
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
      //logger.d(e.toString());
    }
    //notifyListeners();
    return getCustomerProfileResponceModalFromJson(jsonString);
  }

}