import 'dart:convert';
import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/SignupResponceModal.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class SignupApi{

  SignupResponceModal signup_responce_modal;

  var logger =Logger();
  bool isCheked =false;
  void changeStatus(){
    isCheked = true;
  }

  Future<SignupResponceModal> registerCustomer(
      String customerName,
      String customerMobileNo,
      String customerEmailId,
      String customerGroupId,
      String entryStatus,
      String resend,
     ) async {
    try {
      var headerData = {
        'Content-Type': 'application/json'
      };
      var map = {"CustomerName":customerName,
        "CustomerMobileNo": customerMobileNo,
        "CustomerEmailId": customerEmailId,
        "CustomerGroupId": customerGroupId,
        "EntryStatus": entryStatus,};
      final response = await http.post(
          Uri.parse(baseURL + "CustomerMasterApi/RegisterCustomer?resend=$resend"),
          headers: headerData,body: jsonEncode(map));
      print("*****************${response.statusCode}");
      print("response parts  ${response.body}");
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        signup_responce_modal = SignupResponceModal.fromJson(item);
        print(signup_responce_modal.toString());
        //logger.d(response.body);

      } else {
        print("else parts");
        //logger.d('else part');
        //stopLoading();
        //logger.d(signup_responce_modal.data);
      }
    } catch (e) {
      print(e.toString());
      //logger.d(e.toString());
      //stopLoading();
    }

    return signup_responce_modal;
  }

}

