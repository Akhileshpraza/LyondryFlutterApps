import 'package:demogetx/ProductModual/Controllers/resend_otp_controller.dart';
import 'package:get/get.dart';

class ResendOtpBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<ResendOtpController>(() => ResendOtpController());
  }
}