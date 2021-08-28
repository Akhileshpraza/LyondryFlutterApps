import 'package:demogetx/ApiServices/select_offers.dart';
import 'package:demogetx/ApiServices/selecte_services_api.dart';
import 'package:demogetx/CommanModual/AppColors/Lcolors.dart';
import 'package:demogetx/ProductModual/Controllers/order_controller.dart';
import 'package:demogetx/ProductModual/Modals/GetSelectOffersResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/SelectServiceResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelecteServicesController extends GetxController {
  int serviceId = 0;
  var isLoading = true.obs;
  List<ServiceList> servicesList = [];
  SelectServicesApi selectServicesApi = SelectServicesApi();
  SelectServiceResponceModal selectServiceResponceModal;
  ServiceList list;
  String orderStatus;

  //****************************BannerSlider*************************
  GetSelectOffersResponceModal getSelectOffersResponceModal;
  SelectOffersApi selectOffersApi =SelectOffersApi();
  List<OffersList> offersLists= [];
  String token;
  String mobileNo;

  OrderController orderController = Get.put(OrderController());
  //****************************BannerSlider*************************

  @override
  void onInit() {
    orderStatus = AppPreferences.getString(AppPreferences.orderStatus);
    token = AppPreferences.getString(AppPreferences.token);
    mobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    getBannerSliders();
    getSelecteServices();
    super.onInit();
  }

  void getSelecteServices() async {
    try {
      selectServiceResponceModal = await selectServicesApi.getSelectServices(serviceId);
      print(selectServiceResponceModal);
      if (selectServiceResponceModal.success == true) {
        servicesList.addAll(selectServiceResponceModal.serviceList);

        orderController.getSelectOrder().then((value) {
          if(value.success){
            orderController.getSelectOrder();
          }
        });

        update();

        print("show Success address");
      } else {
        print("faild address");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void getBannerSliders() async {
    try {
      getSelectOffersResponceModal = await selectOffersApi.bannerSlider(token,mobileNo);
      print(getSelectOffersResponceModal);
      if (getSelectOffersResponceModal.success == true) {
        offersLists.addAll(getSelectOffersResponceModal.offersList);
        for(int i=0; i<offersLists.length; i++){
          OffersList offersListModal = offersLists.elementAt(i);
          String banner = offersListModal.offerImage;
          print("************banner**********************");
          print(banner);
        }
        update();

        print("show Success BannerSlider");
      } else {
        print("faild BannerSlider");
      }
    } catch (e) {
      print(e.toString());
    }
  }

}
