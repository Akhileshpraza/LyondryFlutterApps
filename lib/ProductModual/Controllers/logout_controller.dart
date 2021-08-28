
import 'package:demogetx/ApiServices/logout_api.dart';
import 'package:demogetx/Bindings/login_binging.dart';
import 'package:demogetx/ProductModual/Modals/LogoutResponceModal.dart';
import 'package:demogetx/ProductModual/Views/login_screen.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class LogoutController extends GetxController{
  LogoutResponceModal logoutResponceModal;
  LogoutApi logoutApi = LogoutApi();
  String mobileNo;

  @override
  void onInit() {
    mobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);


    super.onInit();
  }

  void userLogout(BuildContext context) async{
    LogoutResponceModal logoutData = await logoutApi.userLogout(mobileNo);

    if(logoutData != null) {
      if (logoutData.success == true) {
        AppPreferences.clear();
        AppPreferences.remove(AppPreferences.token);

        Get.offAll(LoginScreen(),binding: LoginBinding());
        Toast.show("Logout Successfully", context);
        print("Logout Successfully");
        print("**********logoutToken**************${AppPreferences.getString(AppPreferences.token)}");
        update();
      }
      else {
        Toast.show(logoutData.errorMessage, context);
        print("Logout failed");
      }
    }
    else{
      Toast.show("Something went wrong", context);
    }
  }
}