
import 'package:demogetx/ApiServices/select_invocice_status.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceStatusModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{

  SelectInvoiceStatusAPI selectInvoiceStatusAPI = SelectInvoiceStatusAPI();
  SelectInvoiceStatusModal selectInvoiceStatusModal;
  List<InvoiceList> InvoiceLists=[];
  String token,mobileNo;
  var isLoading = false.obs;
  String paymentStatus;
  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileNo = AppPreferences.getString(AppPreferences.customerMobileNo);
    getPending();
    super.onInit();
  }

  Future<SelectInvoiceStatusModal> getPending() async{

    try{
      //isLoading(true);
      selectInvoiceStatusModal = await selectInvoiceStatusAPI.getSelectedInvoiceStatus(token,mobileNo);
      print(selectInvoiceStatusModal);
      if(selectInvoiceStatusModal.success){
        //isLoading(false);
        InvoiceLists.addAll(selectInvoiceStatusModal.invoiceList);
        //print("***********************************${pickupRequestLists.length}*******");
        for(int i=0; i<InvoiceLists.length; i++){
          InvoiceList invoiceList = InvoiceLists[i];
          paymentStatus =invoiceList.invoiceStatus;
          print("****************invoiceStatus*******************${paymentStatus}*******");
          update();
        }

        print("Success SelectedInvoiceStatus ");
      }

    }
    catch(e){
      //isLoading(false);
      print( e.toString());

    }
    return selectInvoiceStatusModal;
  }
}