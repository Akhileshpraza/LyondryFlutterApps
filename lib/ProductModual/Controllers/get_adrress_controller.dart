import 'package:demogetx/ApiServices/get_address_api.dart';
import 'package:demogetx/ProductModual/Modals/GetAddressResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:get/get.dart';

class GetAddreesController extends GetxController{

  String token;
  String mobileno;
  var isLoading = true.obs;
  List<CustomerAddressList> customerAddressLists= [];
  GetAddressApi getAddressApi =GetAddressApi();
  GetAddressResponceModal getAddressResponceModal;
  CustomerAddressList customerAddressList;
  //
  // controller.getCustomerProfileResponceModal.data!=null?
  //
  //     :Center(child: CircularProgressIndicator()

  // var customerMobileNo,addressId,customerAddressId;
  // List<CustomerAddressList> customerAddressD=[];
  // DeleteAddressApi deleteAddressApi = DeleteAddressApi();
  // DeleteAddressResponceModal deleteAddressResponceModal;
  // List<Map> mapListData = new List();
  int addressCustomerid,addressId;
  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    print("*************************$token*****************************");
    mobileno = AppPreferences.getString(AppPreferences.customerMobileNo);
    getUserAddress();
    super.onInit();
  }

  void getUserAddress() async{
    try {
      getAddressResponceModal = await getAddressApi.getAddress(token,mobileno);
      print(getAddressResponceModal);
      if(getAddressResponceModal.success ==true){
       customerAddressLists.addAll(getAddressResponceModal.customerAddressList);

       for(int i=0; i<customerAddressLists.length; i++){
         CustomerAddressList customerAddressListModal = customerAddressLists[i];
         addressCustomerid = customerAddressListModal.addressCustomerId;
         addressId = customerAddressListModal.addressId;

         print("****************************");
         print(addressCustomerid);
         print(addressId);

       }
        update();
      }
    }
    catch(e){
      print(e.toString());
    }
  }


  // void deleteAddress(BuildContext context, int index) async{
  //
  //   mapListData.add(CustomerAddressList(
  //       addressCustomerId: customerAddressId,
  //       addressId: addressId).toJson());
  //
  //   String listData = json.encode(mapListData);
  //
  //   DeleteAddressBody dataModel= DeleteAddressBody(customerMobileNo: customerMobileNo,
  //       customerAddressList:listData );
  //
  //   var postAddressDelete =await deleteAddressApi.deleteAddressApi(dataModel, token);
  //
  //   if(postAddressDelete !=null){
  //     if(postAddressDelete.success ==true){
  //       Toast.show("Delete Address Successfully", context);
  //     }
  //     else{
  //       Toast.show(postAddressDelete.errorMessage, context);
  //     }
  //   }
  //
  // }

}