import 'package:demogetx/ApiServices/otp_verify_api.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/ProductModual/Modals/OtpVerifyResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class LoginOtpController extends GetxController{

  OtpVerifyApi otpVerifyApi= OtpVerifyApi();
  //SignupApi signupApi = new SignupApi();
  var resent= "Y";
  TextEditingController otpController = TextEditingController();
  var customerName,customerMobileNo,customerEmailId;

  @override
  void onInit() {

    customerMobileNo =AppPreferences.getString(AppPreferences.customerMobileNo);
    customerName =AppPreferences.getString(AppPreferences.customerName);
    customerEmailId = AppPreferences.getString(AppPreferences.customerEmailId);
    //print("**********************CustomerName*********************"+customerMobileNo);
    print(otpController);
    super.onInit();
  }

  void otpVerifyUser(BuildContext context) async {

    OtpVerifyResponceModal otpVerify = await otpVerifyApi.userOtpVerify("L",customerMobileNo, otpController.text.toString().trim(), 20);
    print(otpVerify.httpResponseHeader);

    if (otpVerify != null) {
      if(otpVerify.success==true){
        AppPreferences.setString(AppPreferences.token, otpVerify.httpResponseHeader);

        Get.offAll(Navigation());
      }
      else{
        Toast.show("Invalid Otp", context);
      }
    }
    else{
      Toast.show("Please Enter Otp!", context);
    }
  }

  // void registerCustomerResendOtp(BuildContext context) async {
  //
  //   var signUp = await signupApi.RegisterCustomer(name,mobileNumber,emailid, "1", "A",resent);
  //   print(signUp.data);
  //
  //
  //   if (signUp != null) {
  //     if(signUp.success==true){
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setInt("CustomerId", signUp.data.customerId);
  //       prefs.setString("CustomerMobileNo",signUp.data.customerMobileNo);
  //       prefs.setString("CustomerEmailId",signUp.data.customerEmailId);
  //       prefs.setString("CustomerName",signUp.data.customerName);
  //     }
  //     else{
  //       Toast.show(signUp.errorMessage, context);
  //     }
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
  otpController.dispose();
    super.onClose();
  }
}

