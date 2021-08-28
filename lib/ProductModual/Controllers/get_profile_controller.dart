
import 'package:demogetx/ApiServices/get_customer_profile_api.dart';
import 'package:demogetx/ProductModual/Modals/GetCustomerProfileResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:get/get.dart';

class GetProfileController extends GetxController{
  String token;
  String mobileno,name;
  var isLoading = true.obs;
  GetCustomerProfileApi getCustomerProfileApi = GetCustomerProfileApi();
  GetCustomerProfileResponceModal getCustomerProfileResponceModal;
  List<Data> listData = [];

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileno = AppPreferences.getString(AppPreferences.customerMobileNo);
    name = AppPreferences.getString(AppPreferences.customerName);
    super.onInit();
  }

  Future<void> customerProfile() async{

    try{
      getCustomerProfileResponceModal = await getCustomerProfileApi.getCustomerProfile(token,mobileno);

      if(getCustomerProfileResponceModal !=null){
        if(getCustomerProfileResponceModal.success==true){
           listData.add(getCustomerProfileResponceModal.data);

          update();
          print("success");
        }
        else{
          String name= getCustomerProfileResponceModal.data.customerName.toString();
          print("***********************************");
          print(name);
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
}