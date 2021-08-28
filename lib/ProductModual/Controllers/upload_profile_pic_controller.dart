
import 'package:demogetx/ApiServices/upload_profile_pic_api.dart';
import 'package:demogetx/ProductModual/Modals/GetProfilePicResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'dart:io' as Io;
import 'dart:convert';

class UploadProfilePicController extends GetxController{

  GetProfilePicResponceModal getProfilePicResponceModal;
  UploadProfilePicApi uploadProfilePicApi = UploadProfilePicApi();
  String token;
  String mobileNo;
  String profilePic;
  String img64;
  PickedFile imageFile;
  final ImagePicker picker = ImagePicker();

  @override
  void onInit() {
    token= AppPreferences.getString(AppPreferences.token);
    mobileNo= AppPreferences.getString(AppPreferences.customerMobileNo);

    super.onInit();
  }

  void userProfilePicUpload(BuildContext context) async{
    GetProfilePicResponceModal uploadProfilePic = await uploadProfilePicApi.getProfilePic(token,mobileNo,img64);

    if(uploadProfilePic != null) {
      if (uploadProfilePic.success == true) {
        print("*****img**********${uploadProfilePic.data.customerProfilePicStr}*************");
        print("*****img**********${imageFile.path}*************");
       // Get.to(LoginScreen(),binding: LoginBinding());
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
}