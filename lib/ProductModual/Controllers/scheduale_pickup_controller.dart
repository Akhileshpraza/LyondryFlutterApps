import 'package:demogetx/ApiServices/get_address_api.dart';
import 'package:demogetx/ApiServices/insert_scheduale_pickup.dart';
import 'package:demogetx/ApiServices/select_store_api.dart';
import 'package:demogetx/ApiServices/select_time_slot_api.dart';
import 'package:demogetx/ApiServices/selecte_services_api.dart';
import 'package:demogetx/ProductModual/Modals/GetAddressResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/InsertPickupResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/SelectServiceResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/SelectStoreResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/SelectTimeSlotResponceModal.dart';
import 'package:demogetx/ProductModual/Views/terms_and_conditions.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class SchedualePickUpController extends GetxController{

  InsertPickupApi insertPickupApi = InsertPickupApi();
  InsertPickupResponceModal insertPickupResponceModal;
  String token,mobileNo;
  int cutomerId;
  String radioButtonValue="Regular";
  bool selectAddress = false;
  int addressIdSelected=0;


  //***************************SelecteServices**************************************
  int serviceId =0;
  ServiceList serviceListModel;
  List<ServiceList> servicesList= [];
  SelectServicesApi selectServicesApi = SelectServicesApi();
  SelectServiceResponceModal selectServiceResponceModal;
  int servicesId;

  //***************************SelecteServices**************************************

  //***************************SelecteStore**************************************
  int storeId =0;
  SelectStoreApi selectStore = SelectStoreApi();
  StoreList storeListModel;
  List<StoreList> storeList =[];
  SelectStoreResponceModal selectStoreResponceModal;
  int storesId;
  int storesId2;
  //***************************SelecteStore**************************************

  //***************************SelecteTimeSlots**************************************
  TimeSlotList timeSlotListModal;
  List<TimeSlotList> selectTileSlotLists= [];
  SelectTimeSlotApi  selectTimeSlotApi =SelectTimeSlotApi();
  SelectTimeSlotResponceModal selectTimeSlotResponceModal;
  int timeSlotsId;
  //***************************SelecteTimeSlots**************************************

  //***************************getAddress**************************************
  CustomerAddressList customerAddressList;
  List<CustomerAddressList> customerAddressLists= [];
  GetAddressApi getAddressApi =GetAddressApi();
  GetAddressResponceModal getAddressResponceModal;
  int addressId;
  int addressCustomerId;
  //***************************getAddress**************************************

  //***************************getDate**************************************
  DateTime selectedDate = DateTime.now();
  var formattedDate;
  String correntDate,passDate;

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),

    );
    if (picked != null && picked != selectedDate)

      //print("**********pickedDate***********${picked}******************");
      correntDate = DateFormat("dd/MM/yyyy").format(DateTime.parse("${picked.toLocal()}".split(' ')[0]));
      passDate = ("${picked.toLocal()}".split(' ')[0]).toString();
      print("**********pickedDatepass***********${passDate}******************");

      selectedDate = picked;

    getSelectTimeSlot();
    notifyChildrens();
    print("**********selectedDate***********${selectedDate}******************");
      update();
  }

  //***************************getDate**************************************


  @override
  void onInit() {
    print("oninit funiond");
    token = AppPreferences.getString(AppPreferences.token);
    mobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    cutomerId = AppPreferences.getInt(AppPreferences.customerId);
    print("********cutomerId*****************${cutomerId}");

    correntDate = DateFormat("dd/MM/yyyy").format(DateTime.parse("${selectedDate.toLocal()}".split(' ')[0]));
    passDate = ("${selectedDate.toLocal()}".split(' ')[0]);
    print("******************Date************************");
    print(correntDate);
    print(selectedDate);
    // print("***********ps*****${passDate}************");
    print( "*********storesId1234**********************${storesId}");
    getSelecteServices();
    getSelectStores();
    getUserAddress();
    //getSelectTimeSlot();
    super.onInit();

  }


  void getSelecteServices() async{
    try {
      selectServiceResponceModal = await selectServicesApi.getSelectServices(serviceId);
      print(selectServiceResponceModal);
      if(selectServiceResponceModal.success ==true){
        servicesList.addAll(selectServiceResponceModal.serviceList);
        update();
        if(servicesList.length>0)
          serviceLists(servicesList.elementAt(0));

        print("show Success SelectService  ${servicesList.length}");
      }
      else{
        print("faild SelectService");
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  void getSelectStores() async{
    try{
      selectStoreResponceModal = await selectStore.getSelectStore(storeId);
      print(selectStoreResponceModal);
      if(selectStoreResponceModal.success ==true){
        storeList.addAll(selectStoreResponceModal.storeList);

        if(storeList.length>0)
          storeLists(storeList.elementAt(0));
        storesId =(storeListModel.storeId);
        storesId2 =storesId;
        print( "*********storesId123**********************${storesId}");
        print("show Success SelectStore ");
        getSelectTimeSlot();
        update();

      }
      else{
        print("faild SelectStore");
      }
    }
    catch(e){

    }
  }

  Future<SelectTimeSlotResponceModal> getSelectTimeSlot() async{
    try {
      selectTileSlotLists.clear();
      selectTimeSlotResponceModal = await selectTimeSlotApi.getTimeSlot(passDate,storesId.toString(),token,mobileNo);
      print(selectTimeSlotResponceModal);
      if(selectTimeSlotResponceModal.success ==true){
        selectTileSlotLists.addAll(selectTimeSlotResponceModal.timeSlotList);
        update();
        if (selectTileSlotLists.length > 0)

          // for(int i=0; i<selectTileSlotLists.length; i++){
          //   timeSlotsLists(selectTileSlotLists.elementAt(i));
          //
          // }

          timeSlotsLists(selectTileSlotLists.elementAt(0));

        print("show Success SelectTimeSlot ");
      }
      else{
        print("faild SelectTimeSlot");
      }
    }
    catch(e){
      print(e.toString());
    }
    return selectTimeSlotResponceModal;
  }

  Future<GetAddressResponceModal> getUserAddress() async{
    try {
      getAddressResponceModal = await getAddressApi.getAddress(token,mobileNo);
      print(getAddressResponceModal);
      if(getAddressResponceModal.success ==true){
        customerAddressLists.addAll(getAddressResponceModal.customerAddressList);
        for(int i =0; i<customerAddressLists.length; i++){
          CustomerAddressList customerAddressListModal = customerAddressLists[i];
          addressCustomerId = customerAddressListModal.addressCustomerId;
          addressId = customerAddressListModal.addressId;
          print("addressId*****************$addressId");
        }
        // address(customerAddressList);
        update();
        print("show Success getAddress ");
      }
      else{
        print("Failed getAddress ");
      }
    }
    catch(e){
      print(e.toString());
    }
    return getAddressResponceModal;
  }

  void pickupSchedual(BuildContext context) async{
    //print("^^^^^addressIdSelected^^^^^^^^^^^^$addressIdSelected");
    //insertPickupResponceModal  = await insertPickupApi.insertPickup(token,mobileNo,713,201,2,1,652,1,radioButtonValue);
    insertPickupResponceModal  = await insertPickupApi.insertPickup(cutomerId,timeSlotsId,servicesId,storesId,addressIdSelected,1,radioButtonValue,token,mobileNo);

    if(insertPickupResponceModal != null) {
      if (insertPickupResponceModal.success == true) {

        Get.to(TermsAndConditionsScreen());
      }
      else {
        Toast.show(insertPickupResponceModal.errorMessage, context);
      }
    }
    else{
      Toast.show("Somthing Went Worng", context);
    }
  }

  void serviceLists(ServiceList data){
       serviceListModel = data;
       print(serviceListModel.serviceId);
       servicesId = serviceListModel.serviceId;
       update();
  }

  void storeLists(StoreList storeListData){
      storeListModel=storeListData;
       storesId =(storeListModel.storeId);
        // storesId2 = storesId;
      //print("************storesId***************${storesId}****************");
      update();

     // print("************storesId12***************${storesId}****************");
  }

  void timeSlotsLists(TimeSlotList timeSlotListData) {
    timeSlotListModal = timeSlotListData;
    print(timeSlotListModal.timeSlotId);
    timeSlotsId=timeSlotListModal.timeSlotId;
    print("******timeSlotsId*************$timeSlotsId");
    update();
  }

  void address(CustomerAddressList addressListData) {
    customerAddressList = addressListData;
    addressId=customerAddressList.addressCustomerId;
    //print("***********************addressId****************$addressId***************");
    update();
  }

  void handleradioButton(String value) {
    radioButtonValue = value;
    //print("*********radioButtonValue*******************$radioButtonValue");
    update();
  }


  void radioButtonAddress(bool value) {
    selectAddress = value;
    print("*********selectAddress*******************$selectAddress");
    update();
  }

  // @override
  // void refresh() {
  //   getSelectTimeSlot();
  //   super.refresh();
  // }

}