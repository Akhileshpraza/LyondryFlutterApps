import 'package:demogetx/ApiServices/insert_feedback_api.dart';
import 'package:demogetx/ApiServices/selecte_invoice_api.dart';
import 'package:demogetx/ProductModual/Modals/InsertFeedbackResponceModal.dart';
import 'package:demogetx/ProductModual/Modals/SelectInvoiceResponceModal.dart';
import 'package:demogetx/Utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'dart:io';
import 'package:path/path.dart';

class FeedBackController extends GetxController{

  InsertFeedBackApi insertFeedBackApi = InsertFeedBackApi();
  InsertFeedbackResponceModal insertFeedbackResponceModal;
  TextEditingController descriptionController;
  String token,mobileNo;

  //******************************multipalImageUploaded******************
  var image;
  List imageArray=[];
//************************currentDate********************
  DateTime now = DateTime.now();
  DateFormat formatter;
  String formatted,correntDate;

  //***************************GetItems**************************************
  SelectInvoiceResponceModal selectInvoiceResponceModal;
  SelectInvoiceApi selectInvoiceApi = SelectInvoiceApi();
  List<GridTran> gridTranList= [];
  List<InvoiceMaster> invoiceMasterList=[];
  GridTran gridTranModal;
  int orderId;
  String invoiceNo;
  var data;
  String itemCode;
  String itemName;
  String itemImages;
  String img64;



  @override
  void onInit() {
    descriptionController = TextEditingController();
    token = AppPreferences.getString(AppPreferences.token);
    mobileNo =AppPreferences.getString(AppPreferences.customerMobileNo);

    formatter = DateFormat('yyyy-MM-dd');
    formatted = formatter.format(now);
    correntDate = DateFormat("dd/MM/yyyy").format(DateTime.parse("${formatted.toString()}".split(' ')[0]));

    data = Get.arguments;
    orderId = data[0];
    invoiceNo =data[1];
    print("############################$orderId");
    print("############################${invoiceNo.toString()}");
    print("############################${formatted.toString()}");

    getInvoice();
     super.onInit();
  }

  void insertFeedbacks(BuildContext context) async{
    insertFeedbackResponceModal  = await insertFeedBackApi.insertFeedBack(token,mobileNo,formatted,invoiceNo,"I00001",descriptionController.text.toString(),img64);
    if(insertFeedbackResponceModal != null) {
      if (insertFeedbackResponceModal.success == true) {

        Toast.show("FeedBack Send Successfully", context);
      }
      else {
        Toast.show(insertFeedbackResponceModal.errorMessage, context);
      }
    }
    else{
      Toast.show("Feedback Went Worng", context);
    }
  }

  void openCamera() async {
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    print("%%%%%%%%%%%%%%%%%%%%%%$image");
    File file = new File(image.path);
    itemImages = basename(file.path);
    print("%%%%%%%%itemImages%%%%%%%%%%%%%%$itemImages");
    imageArray.add(image);
    imageArray;
    print("%%%%%%%%%%%%%%%%%%%%%%$imageArray");
    update();
  }


  void getInvoice() async{
    try {
      selectInvoiceResponceModal = await selectInvoiceApi.getSelectInvoice(token,mobileNo,orderId);
      print(selectInvoiceResponceModal);
      if(selectInvoiceResponceModal.success){
        gridTranList.addAll(selectInvoiceResponceModal.invoiceMaster.gridTrans);

        if(gridTranList.length>0)
          getGridTranList(gridTranList.elementAt(0));
        update();
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  void itemChange(bool val, int index) {
      gridTranList[index].isChecked = val;

  }

  void getGridTranList(GridTran data){
    gridTranModal = data;
    print("@@@@@@@@${gridTranModal.invoiceTranItemCode}");

    update();
  }

}