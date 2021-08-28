
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/GetSelectPickupCompletedModal.dart';
import 'package:http/http.dart' as http;

class SelectPickupCompletedApi{
  GetSelectPickupCompletedModal getSelectPickupCompletedModal;

  var jsonString;
  Future<GetSelectPickupCompletedModal> getPickupCompleted(String app, String token, String mobileNo,int pickupRequestId) async {
    try {
      var urlToken ={'App': app,'CustomerToken' : token,'MobileNo' :mobileNo, 'PickupRequestId' :pickupRequestId.toString()};
      final response = await http.get(baseURL + "PickupCompletedApi/SelectPickupCompleted", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getSelectPickupCompletedModalFromJson(jsonString);

      } else {
        print("else parts");

        return null;
      }
    } catch (e) {
      print(e.toString());

    }
    return getSelectPickupCompletedModalFromJson(jsonString);
  }

}