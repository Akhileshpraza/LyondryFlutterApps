import 'dart:async';
import 'dart:convert';
import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/GetSelecteOrder.dart';
import 'package:http/http.dart' as http;

class SelectOrderApi{

  GetSelecteOrderModal getSelecteOrderModal;

  var jsonString;
  Future<GetSelecteOrderModal> getOrders(String token,String mobileNo,int pickupRequestCustomerId) async {
    try {
      var urlToken ={"Token": token,"MobileNo": mobileNo,"PickupRequestCustomerId":pickupRequestCustomerId.toString()};
      final response = await http.get(baseURL +"PickupRequestApi/SelectOrder", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getSelecteOrderModalFromJson(jsonString);

      } else {
        print("else parts");
        return null;
      }
    } catch (e) {
      print(e.toString());

    }
    return getSelecteOrderModalFromJson(jsonString);
  }
}