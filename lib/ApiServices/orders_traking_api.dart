
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/OrderTraking.dart';
import 'package:http/http.dart' as http;

class OrderTrakingApi{

  OrderTrakingModal orderTrakingModal;

  var jsonString;
  Future<OrderTrakingModal> getOrderTraking(String token,String mobileNo,int trackingId,int trackingCustomerId) async {
    try {
      var urlToken ={"Token": token,"MobileNo": mobileNo,"TrackingId":trackingId.toString(),"TrackingCustomerId" :trackingCustomerId.toString()};
      final response = await http.get(baseURL +"OrderTrackingApi/OrderTracking", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return orderTrakingModalFromJson(jsonString);

      } else {
        print("else parts");
        return null;
      }
    } catch (e) {
      print(e.toString());

    }
    return orderTrakingModalFromJson(jsonString);
  }

}