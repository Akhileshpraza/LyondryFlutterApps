import 'package:demogetx/ApiServices/signup_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ResendOtpController extends GetxController{

  SignupApi signupApi = new SignupApi();

  var name,emailid,mobile;
  var resent= "Y";

  @override
  void onInit() {

    super.onInit();

  }

  void registerCustomerResendOtp(BuildContext context) async {

      await SharedPreferences.getInstance().then((prefs) async {
        name= prefs.getString("customerName");
        emailid = prefs.getString("customerMoboleNumber");
        mobile = prefs.getString("customerEmailId");
        print("*******************************");
        print(name);

        var signUp = await signupApi.registerCustomer(name,mobile,emailid, "1", "A",resent);
        print(signUp.data);

        if (signUp != null) {
          if(signUp.success==true){

            // Get.to(SignupOtpScreen());

          }
          else{
            Toast.show(signUp.errorMessage, context);
          }
        }

      } );
  }

  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }

}