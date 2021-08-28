import 'dart:typed_data';
import 'package:demogetx/ApiServices/delete_address_api.dart';
import 'package:demogetx/ApiServices/get_address_api.dart';
import 'package:demogetx/ApiServices/get_customer_profile_api.dart';
import 'package:demogetx/ApiServices/get_profile_pick_api.dart';
import 'package:demogetx/ProductModual/Modals/DeleteAddressResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/GetAddressResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/GetCustomerProfileResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/GetProfilePicResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';


class ProfileController extends GetxController{

  String token;
  String mobileno,name,emailid;
  var isLoading = true.obs;
  String customerUserName,customerUserEmailId,customerUserGender,customerUserDob;
  String setDOB;
  GetCustomerProfileApi getCustomerProfileApi = GetCustomerProfileApi();
  GetCustomerProfileResponceModal getCustomerProfileResponceModal;
  GetProfilePicResponceModal getProfilePicResponceModal;
  GetProfilePickApi getProfilePickApi = GetProfilePickApi();
  Uint8List data1;
  int setAddressCustomerId;
  int setAddressId;
  String setHouseName="";
  String setStreet,setCity,setLandmark,setPincode,setAddressDefault,setAddressType;
  //*************************DeleteAddress************
  var customerMobileNo,addressId,customerAddressId;
  DeleteAddressApi deleteAddressApi = DeleteAddressApi();
  DeleteAddressResponceModal deleteAddressResponceModal;

  //*************************getAddress************
  //var isLoading = true.obs;
  //List<CustomerAddressList> customerAddressLists= [];
  GetAddressApi getAddressApi =GetAddressApi();
  GetAddressResponceModal getAddressResponceModal;
  CustomerAddressList customerAddressList;
  CustomerAddressList addressListModal;


  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileno = AppPreferences.getString(AppPreferences.customerMobileNo);
    setAddressCustomerId = AppPreferences.getInt(AppPreferences.customerId);
    name = AppPreferences.getString(AppPreferences.customerName);
    emailid = AppPreferences.getString(AppPreferences.customerEmailId);

    //print("${setAddressId}**************************${setAddressCustomerId}");

     getUserAddress();
     customerProfile();
    // getProfilePick();
    callAll();
    super.onInit();
  }

  void callAll(){
        getProfilePick().then((value) => isLoading(false));


    // void callAll(){
    //   customerProfile().then((value) {
    //     getUserAddress().then((value)  {
    //       getProfilePick().then((value) => isLoading(false));
    //     });
    //   });

    //getProfilePick();
  }

  Future<void> customerProfile() async{

    try{
      getCustomerProfileResponceModal = await getCustomerProfileApi.getCustomerProfile(token,mobileno);

      if(getCustomerProfileResponceModal.success== true){

        customerUserName = getCustomerProfileResponceModal.data.customerName.toString();

        customerUserEmailId= getCustomerProfileResponceModal.data.customerEmailId.toString();
        customerUserGender = getCustomerProfileResponceModal.data.customerGender.toString();
        customerUserDob = getCustomerProfileResponceModal.data.customerDob.toString();
        setDOB=  DateFormat("dd/MM/yyyy").format(DateTime.parse(customerUserDob==null? "DOB":customerUserDob));

        print("*************Name********$customerUserName*******************");
        print("*************$customerUserName***************************");
        print(customerUserName);

        update();
        print("success");
      }
      else{
        if(getCustomerProfileResponceModal.success== false){

          customerUserName = getCustomerProfileResponceModal.data.customerName.toString();
          customerUserEmailId= getCustomerProfileResponceModal.data.customerEmailId.toString();
          customerUserGender = getCustomerProfileResponceModal.data.customerGender.toString();
          customerUserDob = getCustomerProfileResponceModal.data.customerDob.toString();
          print("********failed*****Name***************************");
          print("*************$customerUserDob***************************");
          print(customerUserName);
          update();
          print("failed");
        }

      }

       // if(getCustomerProfileResponceModal !=null){
       //   if(getCustomerProfileResponceModal.success==true){
       //    // listData.addAll(getCustomerProfileResponceModal.data);
       //
       //     update();
       //     print("success");
       //   }
       //   else{
       //    String name= getCustomerProfileResponceModal.data.customerName.toString();
       //    print("***********************************");
       //    print(name);
       //     print("failed");
       //   }
       // }
       // else{
       //
       //
       //   //Toast.show("Somthing Worng", context);
       // }

    } catch (e){
      //isLoading(false);
    } 
  }

  Future<void> getProfilePick() async{

    try{
      getProfilePicResponceModal = await getProfilePickApi.getUserProfilePick(token,mobileno);
      if(getProfilePicResponceModal !=null){
        if(getProfilePicResponceModal.success==true){

          update();
          print("success");
        }
        else{
          print("failed");
        }
      }
      else{
        // Toast.show("Somthing Worng", context);
      }

    } catch (e){
      //isLoading(false);
    }
  }

  Future<GetAddressResponceModal> getUserAddress() async{
    try {
      getAddressResponceModal = await getAddressApi.getAddress(token,mobileno);
      print(getAddressResponceModal);
      if(getAddressResponceModal.success ==true){
       // customerAddressLists.addAll(getAddressResponceModal.customerAddressList);

        if(getAddressResponceModal.customerAddressList.length>0)
          getIds(getAddressResponceModal.customerAddressList.elementAt(0));
        update();
      }
    }
    catch(e){
      print(e.toString());
    }
    return getAddressResponceModal;
  }


  void deleteAddress(BuildContext context, int index) async{

    var postAddressDelete = await deleteAddressApi.deleteAddressApi(setAddressId,setAddressCustomerId, token,mobileno);

    if(postAddressDelete !=null){
      if(postAddressDelete.success ==true){
        Toast.show("Delete Address Successfully", context);
      }
      else{
        Toast.show(postAddressDelete.errorMessage, context);
      }
    }

  }

  void getIds (CustomerAddressList addressList){
      customerAddressList = addressList;
      setAddressId = customerAddressList.addressId;
      print("************id*****************");
      print(setAddressId);
  }

}