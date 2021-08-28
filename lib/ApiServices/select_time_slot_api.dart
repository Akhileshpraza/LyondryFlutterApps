
import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/SelectTimeSlotResponceModal.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';
class SelectTimeSlotApi {

  SelectTimeSlotResponceModal selectTimeSlotResponceModal;

  var isLoading = false;
  String jsonString;
  Future<SelectTimeSlotResponceModal> getTimeSlot(String slotDate ,String storeId, String token,String mobileNo) async {
    try {
      var urlToken ={"Token" : token,"MobileNo": mobileNo};
      final response = await http.get(baseURL +"TimeSlotApi/SelectTimeSlot?SlotDate=$slotDate&StoreId=$storeId", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return selectTimeSlotResponceModalFromJson(jsonString);

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
    return selectTimeSlotResponceModalFromJson(jsonString);
  }
}