import 'dart:convert';
import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/GetUpdateStatusModal.dart';
import 'package:http/http.dart' as http;

class GetUpdateStatusApi{

  GetUpdateStatusModal getUpdateStatusModal;

  var jsonString;
  Future<GetUpdateStatusModal> getUpdateStatusAcceptAndCancel( String token,String mobileNo, int pickupRequestId,int pickupStatusId) async {
    try {
      var urlToken ={'Token' : token,'MobileNo': mobileNo,'PickupRequestId' :pickupRequestId.toString(), 'PickupStatusId' :pickupStatusId.toString()};
      final response = await http.post(baseURL + "PickupStatusApi/UpdateStatus", headers: urlToken);
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        jsonString =response.body;
        return getUpdateStatusModalFromJson(jsonString);

      } else {
        print("else parts");

        return null;
      }
    } catch (e) {
      print(e.toString());

    }
    return getUpdateStatusModalFromJson(jsonString);
  }

}