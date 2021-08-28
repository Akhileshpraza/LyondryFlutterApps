
import 'dart:convert';

import 'package:demogetx/ProductModual/Modals/LogoutResponceModal.dart';
import 'package:http/http.dart' as http;

import 'apis.dart';

class LogoutApi{

  LogoutResponceModal logoutResponceModal;

  Future<LogoutResponceModal> userLogout(String mobileNo) async {
    try {
      final response = await http.post(Uri.parse(baseURL + "LogoutApi/Logout?MobileNo=$mobileNo"));
      print(response);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        logoutResponceModal= LogoutResponceModal.fromJson(item);
      } else {
        print("else parts");

      }
    } catch (e) {
      print(e.toString());

    }
    return logoutResponceModal;
  }
}