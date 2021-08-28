
import 'package:demogetx/ApiServices/selecte_order_api.dart';
import 'package:demogetx/ProductModual/Modals/GetSelecteOrder.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{

  SelectOrderApi selectOrderApi = SelectOrderApi();
  List<PickupRequestList> pickupRequestLists=[];
  GetSelecteOrderModal getSelecteOrderModal;
  String token,mobileNo;
  int customerId;
  String orderStatus;
  var isLoading = false.obs;
  var lstTask = List<dynamic>.empty(growable: true).obs;

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    customerId = AppPreferences.getInt(AppPreferences.customerId) ;
    print("***************${customerId}***********");

    //getSelectOrder();

    callOrder();
    super.onInit();

    //getTask();
  }


  void callOrder(){
    getSelectOrder().then((value) => isLoading(false));

  }

  Future<GetSelecteOrderModal> getSelectOrder() async{

    try{
      isLoading(true);
      getSelecteOrderModal = await selectOrderApi.getOrders(token,mobileNo,customerId);
      print(getSelecteOrderModal);
      if(getSelecteOrderModal.success){
        isLoading(false);
        pickupRequestLists.addAll(getSelecteOrderModal.pickupRequestList);
        //print("***********************************${pickupRequestLists.length}*******");
          for(int i=0; i<pickupRequestLists.length; i++){
            PickupRequestList pickupRequestListModal = pickupRequestLists[i];
            orderStatus =pickupRequestListModal.pickupRequestStatus;
            print("****************orderStatus*******************${orderStatus}*******");
             //print("****************orderLength*******************${orderStatus.length}*******");

            AppPreferences.setString(AppPreferences.orderStatus, orderStatus);
          }

        //print("****************orderStatus*******************${getSelecteOrderModal.pickupRequestList[index].pickupRequestStatus}*******");

        update();
        print("Success Order Lists ");
      }

    }
    catch(e){
      print( e.toString());

    }
    return getSelecteOrderModal;
  }





}

// common snack bar
showSnackBar(String title, String message, Color backgroundColor) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: Colors.white);
}