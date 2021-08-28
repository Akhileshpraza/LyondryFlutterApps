import 'package:demogetx/ApiServices/update_customer_api.dart';
import 'package:demogetx/ApiServices/upload_profile_pic_api.dart';
import 'package:demogetx/Bindings/profile_binging.dart';
import 'package:demogetx/ProductModual/Modals/GetProfilePicResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/UpdateCustomerResponceModal.dart';
import 'package:demogetx/ProductModual/Views/profile.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'dart:io' as Io;
import 'dart:convert';

class UpdateProfileController extends GetxController{


  final GlobalKey<FormState>customerUpdateFormKey=GlobalKey<FormState>();
  UpdateCustomerResponceModal updateCustomerResponceModal;
  UpdateCustomerApi updateCustomerApi = new UpdateCustomerApi();

  var isLoading = true.obs;
  TextEditingController nameController,mobileController,emailController;
  String correntDate,passDate;
  bool isCheked =false;
  String customerMobile,token,customerName,customerEmailid;
  var gender = ['Male', 'Female'];
  String genderItemSelected = 'Male';
  String genderPosition;
  String mobile="";
  String name="";
  String email="";
  String setName,setEmailId,setGender;
  String setDob;
  String profileImage;

  DateTime selectedDate = DateTime.now();
  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
        selectedDate = picked;

    correntDate = DateFormat("dd/MM/yyyy").format(DateTime.parse("${picked.toLocal()}".split(' ')[0]));
    passDate = ("${picked.toLocal()}".split(' ')[0]).toString();
    print("**********pickedDatepass***********$passDate******************");
    print("**********correntDate***********$correntDate******************");

    selectedDate = picked;
    print("**********selectedDate***********$selectedDate******************");
    update();
  }
//***************************upload image************************************

  GetProfilePicResponceModal getProfilePicResponceModal;
  UploadProfilePicApi uploadProfilePicApi = UploadProfilePicApi();
  String profilePic;
  String img64;
  PickedFile imageFile;
  final ImagePicker picker = ImagePicker();
//***************************************************************



  void changeStatus(){
    isCheked = true;
    notifyChildrens();
  }
  @override
  void onInit() {
    nameController = TextEditingController();
    mobileController= TextEditingController();
    emailController = TextEditingController();

    customerMobile = AppPreferences.getString(AppPreferences.customerMobileNo);
    customerName = AppPreferences.getString(AppPreferences.customerName);
    customerEmailid = AppPreferences.getString(AppPreferences.customerEmailId);

    token = AppPreferences.getString(AppPreferences.token);


    if(genderItemSelected=="Male"){
      genderPosition = "0";
    }
    else{
      genderPosition = "1";
    }

    var data = Get.arguments;
    setName= data[0];
    setEmailId =data[1];
    setGender = data[2];
    profileImage = data[4];
    setDob = data[3];

    String setDateOfBirthes = DateFormat("dd/MM/yyyy").format(DateTime.parse("${setDob.toString()}".split(' ')[0]));
    //String setDateOfBirthes = setDob;
    //print("***************$setDateOfBirthes");
    mobileController.text=customerMobile;
    nameController.text=setName==null?customerName:setName;
    emailController.text=setEmailId==null?customerEmailid:setEmailId;
    correntDate =setDateOfBirthes.toString()==null? DateFormat("dd/MM/yyyy").format(DateTime.parse("${selectedDate.toLocal()}".split(' ')[0])):setDateOfBirthes.toString();
    //correntDate = DateFormat("dd/MM/yyyy").format(DateTime.parse("${selectedDate.toLocal()}".split(' ')[0]));
    passDate = ("${selectedDate.toLocal()}".split(' ')[0]).toString();

    //print("***************************$setName\n+$setEmailId\n+$setGender\n+$profileImage");


    super.onInit();
  }

  void updateCustomerProfiles(BuildContext context) async {

    // print(emailController.text.toString()+"*******"+ nameController.text.toString()+"*******"+ genderPosition+ "*********"+  passDate+"*********"+ "*********"+customerMobile+"*********"+token);
    // print("**********true**********$genderPosition*****************");
    var updateprofiles = await updateCustomerApi.updateCustomerProfile(emailController.text.toString().trim(),nameController.text.toString().trim(), genderPosition, passDate,customerMobile,token);

    if (updateprofiles != null) {
      if(updateprofiles.success==true) {

        Get.back();

        Toast.show("Profile Update Successfully", context);
      }
      else{
        Toast.show(updateprofiles.errorMessage, context);
      }
    }
  }

  Future<void> userProfilePicUpload(BuildContext context) async{
    GetProfilePicResponceModal uploadProfilePic = await uploadProfilePicApi.getProfilePic(token,customerMobile,img64);

    if(uploadProfilePic != null) {
      if (uploadProfilePic.success == true) {

        Toast.show("Upload Profile Pic Successfully", context);
        print("Upload Profile Pic Successfully");
      }
      else {
        Toast.show(uploadProfilePic.errorMessage, context);
        print("Upload Profile Pic failed");
      }
    }
    else{
      Toast.show("Something went wrong", context);
    }
  }

  void tackPhoto(ImageSource source) async{
    final pickedFile = await picker.getImage(source: source);
    imageFile =pickedFile;
    final bytes = Io.File(imageFile.path).readAsBytesSync();

    img64 = base64Encode(bytes);
    // print(img64.substring(0, 100));

    print("*****img64**********$img64*************");
    update();
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

  void onDropDownGenderType(String newValueSelected) {
    print("newValueSelected   $newValueSelected");
    this.genderItemSelected = newValueSelected;
    if(genderItemSelected=="Male"){
      genderPosition = "0";
    }
    else{
      genderPosition = "1";
    }
    print("**********true**********$genderPosition*****************");
    update();
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

  void checkCustomerUpdate(){
    final isValid =customerUpdateFormKey.currentState.validate();
    if(!isValid){
      return;
    }
    customerUpdateFormKey.currentState.save();
  }

  // void tackPhoto(ImageSource source) async{
  //   final pickedFile = await picker.getImage(source: source);
  //     imageFile =pickedFile;
  //
  //
  // }
}