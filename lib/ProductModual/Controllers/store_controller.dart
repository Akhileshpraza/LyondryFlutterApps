import 'package:demogetx/ApiServices/select_store_api.dart';
import 'package:demogetx/ProductModual/Modals/SelectStoreResponceModal.dart';
import 'package:get/get.dart';

class StoreController extends GetxController{

  SelectStoreApi selectStore = SelectStoreApi();
  int storeId =0;
  var isLoading = true.obs;
  List<StoreList> storeList =[];
  SelectStoreResponceModal selectStoreResponceModal;

@override
  void onInit() {
  getSelectStores();
    super.onInit();
  }

  void getSelectStores() async{
  try{
    selectStoreResponceModal = await selectStore.getSelectStore(storeId);
    print(selectStoreResponceModal);
    if(selectStoreResponceModal.success ==true){
      storeList.addAll(selectStoreResponceModal.storeList);
      print("***********************************$storeList*******");
      update();
    }
  }
  catch(e){
    isLoading(false);
  }
  }
}


