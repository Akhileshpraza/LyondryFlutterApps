import 'package:demogetx/ProductModual/Controllers/logout_controller.dart';
import 'package:get/get.dart';

class LogoutBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<LogoutController>(() => LogoutController());
  }
}