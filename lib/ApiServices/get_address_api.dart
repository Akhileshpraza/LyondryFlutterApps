import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/GetAddressResponceModal.dart';
import 'package:http/http.dart' as http;
import 'apis.dart';

class GetAddressApi{

  GetAddressResponceModal getAddressResponceModal;
  var isLoading = false;
  var jsonString;
  Future<GetAddressResponceModal> getAddress( String token,String mobileNo) async {
    try {
      var urlToken ={"Token" : token,"MobileNo": mobileNo};
      final response = await http.get(baseURL +"AddressApi/GetAddress", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getAddressResponceModalFromJson(jsonString);

      } else {
        print("else parts");
        //logger.d('else part');
        //logger.d(getCustomerProfile_responce_modal.data);
        return null;
      }
    } catch (e) {
      print(e.toString());
      //logger.d(e.toString());
    }
    //notifyListeners();
    return getAddressResponceModalFromJson(jsonString);
  }
}