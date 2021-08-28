import 'package:demogetx/ApiServices/update_address_api.dart';
import 'package:demogetx/Bindings/profile_binging.dart';
import 'package:demogetx/ProductModual/Controllers/profile_controller.dart';
import 'package:demogetx/ProductModual/Modals/UpdateAddressResponceModal.dart';
import 'package:demogetx/ProductModual/Views/profile.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class UpdateAddressController extends GetxController {
  GlobalKey<FormState> updateAddressssFormKey = GlobalKey<FormState>();
  var house = "";
  var street = "";
  var landmark = "";
  var pincode = "";
  RxBool isProcessing = false.obs;


  bool isCheked = false;
  String defaulteAddress;

  void changeStatus() {
    isCheked = true;
  }

  String token;
  String customerMobileNo;
  TextEditingController houseNameController,
      streetController,
      landmarkController,
      pincodeController;
  var city = ['Bangalore'];
  var cityItemSelected = 'Bangalore';

  var addressType = ['Home', 'Office'];
  var addressTypeItemSelected = 'Home';
  var addressTypePosition;
  String addressLocationLaLo="";
  String addressActive="1";
  String entryStatus="A";
  int customerId;
  int setAddressId,setAddressCustomerId;
  String setHouseName="";
  String setStreet,setCity,setLandmark,setPincode,setAddressDefault,setAddressType;


  UpdateAddressResponceModal updateAddressResponceModal;
  UpdateAddressApi updateAddressApi = UpdateAddressApi();
  ProfileController profileController = Get.put(ProfileController());

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    customerId = AppPreferences.getInt(AppPreferences.customerId);
    print("*************************$token*****************************");
    customerMobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    print("*************customerId************$customerId*****************************");


    if (addressTypeItemSelected == "Home") {
      addressTypePosition = "0";
    } else {
      addressTypePosition = "1";
    }


    var data = Get.arguments;
    setAddressId= data[0];
    setAddressCustomerId =data[1];
    setHouseName = data[2];
    setStreet = data[3];
    setCity =data[4];
    setPincode =data[5];
    setLandmark = data[6];
    setAddressType = data[7];
    setAddressDefault =data[8];
    // print("*******addressId123*************${setAddressId}");
    // print("*******setAddressCustomerId*************${setAddressCustomerId}");
    // print("*******setHouseName*************${setHouseName}");
    // print("*******setStreet*************${setStreet}");
    // print("*******setCity*************${setCity}");
    // print("*******setPincode*************${setPincode}");
    // print("*******setLandmark*************${setLandmark}");
    // print("*******setAddressType*************${setAddressType}");
    // print("*******setAddressDefault*************${setAddressDefault}");
    houseNameController = TextEditingController();
    streetController = TextEditingController();
    landmarkController = TextEditingController();
    pincodeController = TextEditingController();

    houseNameController.text =setHouseName;
    streetController.text = setStreet;
    landmarkController.text = setLandmark;
    pincodeController.text = setPincode;
    super.onInit();
  }

  Future<UpdateAddressResponceModal> userUpdateAddress(BuildContext context) async {
    startLoader();
    var updateAddress = await updateAddressApi.updateAddress(
        customerId,
        setAddressId,
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

    if (updateAddress != null) {
      if (updateAddress.success)


      Toast.show("Update Address Successfully", context);
      profileController.getUserAddress().then((value) {
        if(value.success){
          startStop();
          Get.back();

        }
      });
      //Get.back();

    } else {
      Toast.show(updateAddress.errorMessage, context);
    }
    return updateAddressResponceModal;
  }

  @override
  void onClose() {
    houseNameController.dispose();
    streetController.dispose();
    landmarkController.dispose();
    pincodeController.dispose();

    super.onClose();
  }

  void startLoader(){
    isProcessing.value = true;
  }

  void startStop(){
    isProcessing.value = false;
  }



  String validateHouseName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length < 2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateStreet(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length < 2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validateLandmark(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length < 2) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  String validatePincode(String value) {
    String pattern = r'^[1-9][0-9]{5}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length < 6) {
      return 'Please enter Pincode';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid Pincode';
    }
    return null;
  }

  void checkAddress(BuildContext context) async{
    final isValid = updateAddressssFormKey.currentState.validate();
    if (!isValid) {
      return Toast.show("Error", context);
    } else {
      //userUpdateAddress(context);


    }

    updateAddressssFormKey.currentState.save();
  }

  void onDropDownItemSelected(String newValueSelected) {
    this.cityItemSelected = newValueSelected;
  }

  void onDropDownAddressType(String newValueSelected) {
    print("newValueSelected   $newValueSelected");
    this.addressTypeItemSelected = newValueSelected;
    update();
  }

  void callback() async {

   await update();
  }
}
