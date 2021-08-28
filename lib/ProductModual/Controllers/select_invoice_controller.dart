
import 'package:demogetx/ApiServices/selecte_invoice_api.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:get/get.dart';

class SelectInvoiceController extends GetxController{

  SelectInvoiceResponceModal selectInvoiceResponceModal;
  SelectInvoiceApi selectInvoiceApi = SelectInvoiceApi();
  List<GridTran> gridTranList= [];
  String token;
  String mobileno;

  @override
  void onInit() {
    token = AppPreferences.getString(AppPreferences.token);
    mobileno = AppPreferences.getString(AppPreferences.customerMobileNo);
    getInvoice();
    super.onInit();
  }

  void getInvoice() async{
    try {
      selectInvoiceResponceModal = await selectInvoiceApi.getSelectInvoice(token,mobileno,20047);
      print(selectInvoiceResponceModal);
      if(selectInvoiceResponceModal.success ==true){
        gridTranList.addAll(selectInvoiceResponceModal.invoiceMaster.gridTrans);
        update();
      }
    }
    catch(e){
      print(e.toString());
    }
  }






}