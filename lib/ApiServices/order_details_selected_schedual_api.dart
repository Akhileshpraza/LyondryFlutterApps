
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/SelectedSchedualModal.dart';
import 'package:http/http.dart' as http;
class SelectedSchedualeApi{

  SelectedSchedualModal selectedSchedualModal;

  var jsonString;
  Future<SelectedSchedualModal> getSelectSchedual(String token,String mobileNo,int pickupSchedulePickupRequestId) async {
    try {
      var urlToken ={"Token": token,"MobileNo": mobileNo,"PickupSchedulePickupRequestId":pickupSchedulePickupRequestId.toString()};
      final response = await http.get(baseURL +"PickupScheduleApi/SelectSchedule", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return selectedSchedualModalFromJson(jsonString);

      } else {
        print("else parts");
        return null;
      }
    } catch (e) {
      print(e.toString());

    }
    return selectedSchedualModalFromJson(jsonString);
  }

}