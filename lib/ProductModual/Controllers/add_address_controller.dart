import 'package:demogetx/ApiServices/insert_address_api.dart';
import 'package:demogetx/CommanModual/BottomNavigation/tabbar.dart';
import 'package:demogetx/ProductModual/Controllers/profile_controller.dart';
import 'package:demogetx/ProductModual/Modals/InsertAddressBody.dart';
import 'package:demogetx/ProductModual/Modals/InsertAddressResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class AddAddressController extends GetxController{

  GlobalKey<FormState>addAddressssFormKey=GlobalKey<FormState>();
  var house="";
  var street="";
  var landmark="";
  var pincode ="";

  bool isCheked = false;
  String defaulteAddress="0";
  void changeStatus(){
    isCheked = true;
    defaulteAddress ="1";

  }
  ProfileController profileController = Get.put(ProfileController());
  String token;
  String customerMobileNo;
  String addressLocationLaLo="";
  String addressActive="1";
  String entryStatus="A";
  TextEditingController houseNameController,streetController,landmarkController,pincodeController;
  var city = [ 'Bangalore'];
  var cityItemSelected = 'Bangalore';

  var addressType = [ 'Home','Office'];
  String addressTypeItemSelected = 'Home';
  String addressTypePosition;
  int customerId;
  //List<customerAddress> customerAddressL;
  customerAddress customerAddressL;
  InsertAddressApi insertAddressApi = InsertAddressApi();
  InsertAddressResponceModal insertAddressResponceModal;

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    customerId = AppPreferences.getInt(AppPreferences.customerId);
    print("*************************$token*****************************");
    customerMobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    houseNameController =TextEditingController();
    streetController = TextEditingController();
    landmarkController = TextEditingController();
    pincodeController = TextEditingController();

    if(addressTypeItemSelected =="Home"){
      addressTypePosition = "0";
    }
    else{
      addressTypePosition ="1";
    }

    super.onInit();
  }

  @override
  void onClose() {
    houseNameController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    pincodeController.dispose();

    super.onClose();
  }
  Future<InsertAddressResponceModal> insertAddress(BuildContext context) async{

    var postAddress =await insertAddressApi.insertAddress(
        customerId,
        houseNameController.text.toString(),
        streetController.text.toString(),
        cityItemSelected,
        pincodeController.text.toString(),
        landmarkController.text.toString(),
        addressLocationLaLo,
        addressTypePosition,
        defaulteAddress,
        addressActive,
        entryStatus,
        token,
        customerMobileNo);

    if(postAddress !=null){
      if(postAddress.success ==true)

        Toast.show("New Address Add Successfully", context);
      profileController.getUserAddress().then((value) {
        if(value.success){
          Get.back();
        }
      });

      }
      else{
        Toast.show(postAddress.errorMessage, context);
      }
      return insertAddressResponceModal;
    }


  String validateHouseName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length <2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateStreet(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length <2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateLandmark(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length <2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validatePincode(String value) {
    String pattern = r'^[1-9][0-9]{5}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length <6) {
      return 'Please enter Pincode';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid Pincode';
    }
    return null;
  }

  void checkAddress(BuildContext context){
    final isValid = addAddressssFormKey.currentState.validate();
    if(!isValid){
      return;
    }else{
      insertAddress(context);
    }
    addAddressssFormKey.currentState.save();
  }

  void onDropDownItemSelected(String newValueSelected) {
    this.cityItemSelected = newValueSelected;
  }


  void onDropDownAddressType(String newValueSelected) {
    print("newValueSelected   $newValueSelected");
    this.addressTypeItemSelected = newValueSelected;
    if(addressTypeItemSelected =="Home"){
      addressTypePosition = "0";
    }
    else{
      addressTypePosition ="1";
    }

    print("*****addressTypePosition***********$addressTypePosition*************");
    update();
  }
}