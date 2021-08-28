
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/GetSelectOrderImagesModal.dart';
import 'package:http/http.dart' as http;

class SelectOrderImagesApi{

  GetSelectOrderImagesModal getSelectOrderImagesModal;

  var jsonString;
  Future<GetSelectOrderImagesModal> getSelectOrderImages( String token,String mobileNo , int pickupRequestId, int pickupRequestItemCode) async {
    try {
      var urlToken ={'Token' : token,'MobileNo': mobileNo,'PickupRequestId': pickupRequestId.toString(),'PickupRequestItemCode': pickupRequestItemCode.toString()};
      final response = await http.get(baseURL +"OrderReturnApi/SelectOrderImages", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getSelectOrderImagesModalFromJson(jsonString);

      } else {
        print("else parts");

        return null;
      }
    } catch (e) {
      print(e.toString());

    }
    //notifyListeners();
    return getSelectOrderImagesModalFromJson(jsonString);
  }

}