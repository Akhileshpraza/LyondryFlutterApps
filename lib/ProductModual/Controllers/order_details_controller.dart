
import 'dart:ffi';

import 'package:demogetx/ApiServices/get_update_status_api.dart';
import 'package:demogetx/ApiServices/order_details_selected_schedual_api.dart';
import 'package:demogetx/ApiServices/orders_traking_api.dart';
import 'package:demogetx/ApiServices/selecte_invoice_api.dart';
import 'package:demogetx/ProductModual/Modals/GetUpdateStatusModal.dart';
import 'package:demogetx/ProductModual/Modals/OrderTraking.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/SelectedSchedualModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController{

  SelectedSchedualModal selectedSchedualModal;
  SelectedSchedualeApi selectedSchedualeApi = SelectedSchedualeApi();
  List<PickupScheduleList> pickupScheduleLists=[];
  String token,mobileNo,customerEmailid;
  int customerId;
  String orderStatus;
  String Status;
  PickupScheduleList pickupScheduleListModal;
  int pickupSchedulePickupRequestId;
  double totalAmount;
  String pickupStatusName,pickupByName,pickupByMobile,invoiceNo,paymentStatus,storeName;
  //*******************************orderTraking****************************
  OrderTrakingModal orderTrakingModal;
  OrderTrakingApi orderTrakingApi = OrderTrakingApi();
  List<OrderTrackingList> orderTrakingLists=[];
  OrderTrackingList orderTakingL;
  OrderTrackingList orderTrackingListModal;
  int trackingCustomerId;
  int trackingId;
  int trackingSerialNo;
  String trackingStatus;
  String trackingPickupBy;
  String trackingDeliveredBy;
  String trackingDate;
  String trackingTime;
  int orderId;
  //***********************************Invoice*************************
  SelectInvoiceResponceModal selectInvoiceResponceModal;
  SelectInvoiceApi selectInvoiceApi = SelectInvoiceApi();
  List<GridTran> gridTranList= [];
  InvoiceMaster invoiceMaster;

  //*******************************UpdateStatus*****Accept and Cancel**************
  GetUpdateStatusModal getUpdateStatusModal;
  GetUpdateStatusApi getUpdateStatusApi =GetUpdateStatusApi();
  //*******************************UpdateStatus*****Accept and Cancel**************

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    customerId = AppPreferences.getInt(AppPreferences.customerId) ;
    customerEmailid = AppPreferences.getString(AppPreferences.customerEmailId) ;


    var data = Get.arguments;
    orderId= data[0];

    getSelectSchedual();
    orderTraking();
    getInvoice();

    super.onInit();
  }

  void getSelectSchedual() async{
    try{
      selectedSchedualModal = await selectedSchedualeApi.getSelectSchedual(token,mobileNo,orderId);
      print(selectedSchedualModal);
      if(selectedSchedualModal.success ==true){
        pickupScheduleLists.addAll(selectedSchedualModal.pickupScheduleList);
        update();
        print("*************************${pickupScheduleLists.length}*******");
        for(int i=0; i<pickupScheduleLists.length; i++){
          pickupScheduleListModal = pickupScheduleLists[i];
          pickupSchedulePickupRequestId =pickupScheduleListModal.pickupSchedulePickupRequestId;
          pickupStatusName = pickupScheduleListModal.pickupStatusName.toString();
          pickupByName = pickupScheduleListModal.pickupByName.toString();
          pickupByMobile = pickupScheduleListModal.pickupByMobile.toString();
          invoiceNo = pickupScheduleListModal.invoiceNo.toString();
          totalAmount = pickupScheduleListModal.totalAmount.toDouble();
          paymentStatus = pickupScheduleListModal.paymentStatus.toString();
          storeName = pickupScheduleListModal.storeName;
          // print("******pickupSchedulePickupRequestId**********${pickupSchedulePickupRequestId}***************");
          // print("******pickupStatusName**********${pickupStatusName}***************");
          // print("******pickupByName**********${pickupByName}***************");
          // print("******pickupByMobile**********${pickupByMobile}***************");
          // print("******invoiceNo**********${invoiceNo}***************");
          // print("******totalAmount**********${totalAmount}***************");
          // print("******paymentStatus**********${paymentStatus}***************");
          // print("******storeName**********${storeName}***************");
        }
        // update();
        print("Success Selecte Scheduale");
      }
    }
    catch(e){

    }
  }

  void orderTraking() async{

    try{
      orderTrakingModal = await orderTrakingApi.getOrderTraking(token,mobileNo,orderId,0);
      print(orderTrakingModal);
      if(orderTrakingModal.success ==true){
        orderTrakingLists.addAll(orderTrakingModal.orderTrackingList);
        //orderTrackingListModal = orderTrakingLists.length as OrderTrackingList;
        print("**********orderTrakingLists***************${orderTrakingLists.length}*******");
        for(int i=0; i<orderTrakingLists.length; i++){
          orderTrackingListModal = orderTrakingLists[i];
          trackingStatus = orderTrackingListModal.trackingStatus;
          trackingDate = orderTrackingListModal.trackingDate;
          trackingTime = orderTrackingListModal.trackingTime;
           print("******trackingStatus12**********${trackingStatus}***************");
          // print("******trackingDate**********${trackingDate}***************");
          // print("******trackingTime**********${trackingTime}***************");
        }

        if(orderTrakingLists.length>0)
          getOrderListItemName(orderTrakingLists.elementAt(0));

        update();

        print("Success Selecte Scheduale");
      }
    }
    catch(e){

    }
  }

  void getInvoice() async{
    try {
      selectInvoiceResponceModal = await selectInvoiceApi.getSelectInvoice(token,mobileNo,orderId);
      print(selectInvoiceResponceModal);
      if(selectInvoiceResponceModal.success ==true){
        invoiceMaster =selectInvoiceResponceModal.invoiceMaster;
        String InvoiceNo = selectInvoiceResponceModal.invoiceMaster.invoiceNo;
        print("***********InvoiceNo**************${InvoiceNo}");
        gridTranList.addAll(selectInvoiceResponceModal.invoiceMaster.gridTrans);
        update();
      }
    }
    catch(e){
      print(e.toString());
    }
  }

//*******************************UpdateStatus*****Accept and Cancel**************
  Future<Void>updateStatusAccept() async{
    print("***************$token******$mobileNo**********$orderId");

    try {
      getUpdateStatusModal = await getUpdateStatusApi.getUpdateStatusAcceptAndCancel(token,mobileNo,orderId,2);
      print(getUpdateStatusModal);
      if(getUpdateStatusModal.success ==true){
       // Toast.show("Schedule Accepted", context);
        print("Schedule Accepted");

      }
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<Void>updateStatusCancel() async{
    print("***************$token******$mobileNo**********$orderId");
    try {
      getUpdateStatusModal = await getUpdateStatusApi.getUpdateStatusAcceptAndCancel(token,mobileNo,orderId,8);
      print(getUpdateStatusModal);
      if(getUpdateStatusModal.success ==true){
        print("Schedule Cancel");
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  void getOrderListItemName(OrderTrackingList data ){
    orderTakingL = data;
    print( "**********trackingStatus1******************${orderTakingL.trackingStatus}");
  }

}