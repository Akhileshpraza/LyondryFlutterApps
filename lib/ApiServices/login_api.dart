import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/LoginResponceModal.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'apis.dart';
class LoginApi{

   LoginResponceModal login_responce_modal;
  var logger =Logger();

  Future<LoginResponceModal> userLogin(String mobileNo) async {
    try {

      final response = await http.post(Uri.parse(baseURL + "LoginApi/Login?MobileNo=$mobileNo"));
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        //logger.d(response.body);
        login_responce_modal= LoginResponceModal.fromJson(item);
        } else {
        print("else parts");
        //logger.d('else part');
        //stopLoading();
        //logger.d(login_responce_modal.data);
      }
    } catch (e) {
      print(e.toString());
      //logger.d(e.toString());
      //stopLoading();
    }
    return login_responce_modal;
  }

}