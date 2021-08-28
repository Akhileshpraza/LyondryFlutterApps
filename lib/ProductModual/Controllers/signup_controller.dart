import 'package:demogetx/ApiServices/signup_api.dart';
import 'package:demogetx/Bindings/signup_otp_binding.dart';
import 'package:demogetx/ProductModual/Views/signup_otp_screen.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class SignupController extends GetxController{

  final GlobalKey<FormState>signupFormKey=GlobalKey<FormState>();

  SignupApi signupApi = new SignupApi();


  TextEditingController nameController,mobileController,emailController;
  var mobile="";
  var name="";
  var email="";
  var resent= "N";
  bool isCheked =false;

  void changeStatus(){
    isCheked = true;
    notifyChildrens();
  }
  @override
  void onInit() {
    nameController = TextEditingController();
    mobileController= TextEditingController();
    emailController = TextEditingController();
    super.onInit();
   // registerCustomer();
  }

  void registerCustomer(BuildContext context) async {

    var signUp = await signupApi.registerCustomer(nameController.text.toString().trim(),
        mobileController.text.toString().trim(), emailController.text.toString().trim(), "1", "A",resent);
    //print(signUp.data);

    if (signUp != null) {
      if(signUp.success==true){
        String customerName = signUp.data.customerName;
        int customerId =signUp.data.customerId;
        String customerMoboleNumber = signUp.data.customerMobileNo;
        String customerEmailId = signUp.data.customerEmailId;
        int customerGroupId = signUp.data.customerGroupId;
        String status = signUp.data.entryStatus;

        AppPreferences.setInt(AppPreferences.customerId, customerId);
        AppPreferences.setString(AppPreferences.customerName, customerName);
        AppPreferences.setString(AppPreferences.customerMobileNo, customerMoboleNumber);
        AppPreferences.setString(AppPreferences.customerEmailId, customerEmailId);
        AppPreferences.setInt(AppPreferences.customerGroupId, customerGroupId);
        AppPreferences.setString(AppPreferences.entryStatus, status);

        Get.to(SignupOtpScreen(),binding: SignupOtpBinding());
        Toast.show("Send Otp Successfully", context);
      }
      else{
        Toast.show(signUp.errorMessage, context);
        print("*errorMessage**************${signUp.errorMessage}");
      }
  }
  }

  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    nameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    super.onClose();


  }

  String validateUserName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length <2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length ==0) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
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

  void checkSignup(){
    final isValid =signupFormKey.currentState.validate();
    if(!isValid){
      return;
    }
    signupFormKey.currentState.save();
  }

}