
import 'dart:ffi';

import 'package:demogetx/ApiServices/get_select_order_images_api.dart';
import 'package:demogetx/ApiServices/select_pickup_completed_api.dart';
import 'package:demogetx/ProductModual/Modals/GetSelectOrderImagesModal.dart';
import 'package:demogetx/ProductModual/Modals/GetSelectPickupCompletedModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:get/get.dart';

class DisplayItemsController extends GetxController{

  GetSelectPickupCompletedModal getSelectPickupCompletedModal;
  SelectPickupCompletedApi selectPickupCompletedApi = new SelectPickupCompletedApi();
  List<DeliveryDetailsList> deliveryDetailsLists = [];

  String token ,mobileNo,deliveryUserName;
  int pickupRequestId;
  var getData;
  String app = "L";

  GetSelectOrderImagesModal getSelectOrderImagesModal;
  SelectOrderImagesApi selectOrderImagesApi = SelectOrderImagesApi();
  int pickupRequestItemCode;
  List<OrderImagesList> orderimagesLists =[];

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileNo =AppPreferences.getString(AppPreferences.customerMobileNo);

    getData = Get.arguments;
    deliveryUserName = getData[0];
    pickupRequestId =getData[1];
    print("**&^deliveryUserName*************$deliveryUserName************$pickupRequestId");
    getDisplayItems();
    super.onInit();
  }


  Future<Void> getDisplayItems() async{
    try {
      getSelectPickupCompletedModal = await selectPickupCompletedApi.getPickupCompleted(app,token,mobileNo,pickupRequestId);
      print(getSelectPickupCompletedModal);
      if(getSelectPickupCompletedModal.success ==true){
        deliveryDetailsLists.addAll(getSelectPickupCompletedModal.deliveryDetailsList);
        update();
       print("***********Deisply Items");
      }
    }
    catch(e){
      print(e.toString());
    }
  }


  Future<Void> getSelectOrderImg() async{
    try {
      getSelectOrderImagesModal = await selectOrderImagesApi.getSelectOrderImages(token,mobileNo,pickupRequestId,pickupRequestItemCode);
      print(getSelectOrderImagesModal);
      if(getSelectOrderImagesModal.success ==true){
        orderimagesLists.addAll(getSelectOrderImagesModal.orderImagesList);
        update();
        print("***********Deisply Items");
      }
    }
    catch(e){
      print(e.toString());
    }
  }


}