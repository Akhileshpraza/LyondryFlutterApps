import 'package:demogetx/ProductModual/Controllers/login_otp_controller.dart';
import 'package:get/get.dart';

class LoginOtpBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<LoginOtpController>(() => LoginOtpController());
  }
}