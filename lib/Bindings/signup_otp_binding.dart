import 'package:demogetx/ProductModual/Controllers/signup_otp_controller.dart';
import 'package:get/get.dart';

class SignupOtpBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<SignupOtpController>(() => SignupOtpController());
  }
}