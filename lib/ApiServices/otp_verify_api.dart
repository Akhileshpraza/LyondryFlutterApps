
import 'dart:convert';

import 'package:demogetx/ApiServices/apis.dart';
import 'package:demogetx/ProductModual/Modals/OtpVerifyResponceModal.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;


class OtpVerifyApi{

  OtpVerifyResponceModal otpVerifyResponceModal;
  var logger =Logger();

  Future<OtpVerifyResponceModal> userOtpVerify(
      String otpType,
      String otpMobileNo,
      String otpNo,
      int otpExpiryMinutes) async {
    try {
      var map = {"OtpType": otpType,
        "OtpMobileNo": otpMobileNo,
        "OtpNo": otpNo,
        "OtpExpiryMinutes": otpExpiryMinutes.toString()};
      final response = await http.post(Uri.parse(baseURL + "OtpApi/Validate"), body: map);
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        otpVerifyResponceModal = OtpVerifyResponceModal.fromJson(item);
        print(otpVerifyResponceModal.toString());
        print(item);
        //logger.d(response.body);

      } else {
        print("else parts");
        logger.d('else part');
        //stopLoading();
        logger.d(otpVerifyResponceModal.success);
      }
    } catch (e) {
      print(e.toString());
      logger.d(e.toString());
      //stopLoading();
    }
    //notifyListeners();
    return otpVerifyResponceModal;
  }
}


