import 'package:demogetx/ApiServices/login_api.dart';
import 'package:demogetx/Bindings/login_otp_binding.dart';
import 'package:demogetx/ProductModual/Modals/LoginResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:demogetx/ProductModual/Views/login_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:toast/toast.dart';


class LoginController extends GetxController{

  final GlobalKey<FormState>loginFormKey=GlobalKey<FormState>();
  LoginApi loginApi = new LoginApi();
  TextEditingController mobileController;
  var mobile="";

  @override
  void onInit() {
    mobileController = TextEditingController();
    print(mobileController);
    super.onInit();
  }

  void userLogin(BuildContext context) async{
    LoginResponceModal loginData = await loginApi.userLogin(mobileController.text.toString().trim());
    //print("***************loginData****${loginData.httpResponseHeader} ***************");

    if(loginData != null) {
      if (loginData.success == true) {
        AppPreferences.setInt(AppPreferences.customerId, loginData.data.customerId);
        AppPreferences.setString(AppPreferences.customerName, loginData.data.customerName);
        AppPreferences.setString(AppPreferences.customerMobileNo, loginData.data.customerMobileNo);
        AppPreferences.setString(AppPreferences.customerEmailId, loginData.data.customerEmailId);
        AppPreferences.setString(AppPreferences.entryStatus, loginData.data.entryStatus);

        Get.to(LoginOtpScreen(), binding: LoginOtpBinding());
        Toast.show("Send Otp Successfully", context);
      }
      else {
        Toast.show(loginData.errorMessage, context);
      }
    }
    else{
      Toast.show("Somthing Worng", context);
    }
  }


  @override
  void onReady() {
    super.onReady();
  }


  @override
  void onClose() {
    mobileController.dispose();
    super.onClose();

  }

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length <10) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  void checkLogin(BuildContext context){
    final isValid =loginFormKey.currentState.validate();
    if(!isValid){
      return ;
    }
    else{
      userLogin(context);
    }
    loginFormKey.currentState.save();
  }
}