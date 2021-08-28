import 'package:demogetx/ApiServices/delete_address_api.dart';
import 'package:demogetx/ProductModual/Modals/BodyPeramertsPass/DeleteAddressBody.dart';
import 'package:demogetx/ProductModual/Modals/DeleteAddressResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

class DeleteAddressController extends GetxController{

  var customerMobileNo,token,addressId,customerAddressId;
  List<CustomerAddressList> customerAddressD=[];
  DeleteAddressApi deleteAddressApi = DeleteAddressApi();
  DeleteAddressResponceModal deleteAddressResponceModal;
  List<Map> mapListData = [];

  int setAddressId,setAddressCustomerId;
  String setHouseName="";
  String setStreet,setCity,setLandmark,setPincode,setAddressDefault,setAddressType;


  @override
  void onInit() {
    customerMobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    token = AppPreferences.getString(AppPreferences.token);
    //addressId = AppPreferences.getString(AppPreferences.addressId);
    customerAddressId = AppPreferences.getString(AppPreferences.customerAddressId);
    print(customerAddressId);


    // var data = Get.arguments;
    // setAddressId= data[0];
    // setAddressCustomerId =data[1];
    // setHouseName = data[2];
    // setStreet = data[3];
    // setCity =data[4];
    // setPincode =data[5];
    // setLandmark = data[6];
    // setAddressType = data[7];
    // setAddressDefault =data[8];
    // print("*******addressId123*************${setAddressId}");
    // print("*******setAddressCustomerId*************${setAddressCustomerId}");
    // print("*******setHouseName*************${setHouseName}");
    // print("*******setStreet*************${setStreet}");
    // print("*******setCity*************${setCity}");
    // print("*******setPincode*************${setPincode}");
    // print("*******setLandmark*************${setLandmark}");
    // print("*******setAddressType*************${setAddressType}");
    // print("*******setAddressDefault*************${setAddressDefault}");

    super.onInit();
  }

  void deleteAddress(BuildContext context, int index) async{

    // mapListData.add(CustomerAddressList(
    //     addressCustomerId: customerAddressId,
    //     addressId: addressId).toJson());
    //
    // String listData = json.encode(mapListData);
    //
    // DeleteAddressBody dataModel= DeleteAddressBody(customerMobileNo: customerMobileNo,
    //     customerAddressList:listData );

    var postAddressDelete =await deleteAddressApi.deleteAddressApi(setAddressId,setAddressCustomerId, token,customerMobileNo);

    if(postAddressDelete !=null){
      if(postAddressDelete.success ==true){
        Toast.show("Delete Address Successfully", context);
      }
      else{
        Toast.show(postAddressDelete.errorMessage, context);
      }
    }

  }
}