import 'package:get/get.dart';
class TermsConditions extends GetxController{

  bool isCheked =false;

  void changeStatus(){
    isCheked = true;
    notifyChildrens();
  }
}