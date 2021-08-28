
import 'package:demogetx/ApiServices/otp_verify_api.dart';
import 'package:demogetx/ApiServices/signup_api.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class SignupOtpController extends GetxController{

  OtpVerifyApi otpVerifyApi= OtpVerifyApi();
  SignupApi signupApi = new SignupApi();
  var resent= "Y";
  var customerName,customerMobileNo,customerEmailId;

   TextEditingController otpController= TextEditingController();


  @override
  void onInit() {

    customerMobileNo =AppPreferences.getString(AppPreferences.customerMobileNo);
    customerName =AppPreferences.getString(AppPreferences.customerName);
    customerEmailId = AppPreferences.getString(AppPreferences.customerEmailId);
    print("**********************CustomerName*********************"+customerMobileNo);
    super.onInit();
  }

  void otpVerifyUser(BuildContext context) async {

    var otpVerify = await otpVerifyApi.userOtpVerify("R",customerMobileNo, otpController.text.trim(), 20);
    print(otpVerify.httpResponseHeader);

    if (otpVerify != null) {
      if(otpVerify.success==true){
        AppPreferences.setString(AppPreferences.token, otpVerify.httpResponseHeader);

        Get.to(Navigation());
      }
      else{
        Toast.show(otpVerify.errorMessage, context);
      }
    }
  }

  void registerCustomerResendOtp(BuildContext context) async {

    var signUp = await signupApi.registerCustomer(customerName,customerMobileNo,customerEmailId, "1", "A",resent);
    print(signUp.data);


    if (signUp != null) {
      if(signUp.success==true){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt("CustomerId", signUp.data.customerId);
        prefs.setString("CustomerMobileNo",signUp.data.customerMobileNo);
        prefs.setString("CustomerEmailId",signUp.data.customerEmailId);
        prefs.setString("CustomerName",signUp.data.customerName);
      }
      else{
        Toast.show(signUp.errorMessage, context);
      }
    }
  }

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
