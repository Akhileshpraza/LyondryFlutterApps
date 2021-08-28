
import 'package:demogetx/ApiServices/select_time_slot_api.dart';
import 'package:demogetx/ProductModual/Modals/SelectTimeSlotResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:get/get.dart';

class SelectTimeSlotController extends GetxController{

  String token;
  String mobileno;
  var isLoading = true.obs;
  List<TimeSlotList> selectTileSlotLists= [];
  SelectTimeSlotApi  selectTimeSlotApi =SelectTimeSlotApi();
  SelectTimeSlotResponceModal selectTimeSlotResponceModal;

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileno = AppPreferences.getString(AppPreferences.customerMobileNo);
    getSelectTimeSlot();
    super.onInit();
  }

  void getSelectTimeSlot() async{
    try {
      selectTimeSlotResponceModal = await selectTimeSlotApi.getTimeSlot("2021-07-27","1",token,mobileno);
      print(selectTimeSlotResponceModal);
      if(selectTimeSlotResponceModal.success ==true){
        selectTileSlotLists.addAll(selectTimeSlotResponceModal.timeSlotList);
        update();

      }
    }
    catch(e){
      print(e.toString());
    }
  }


  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}