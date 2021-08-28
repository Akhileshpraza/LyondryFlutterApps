import 'package:demogetx/ProductModual/Controllers/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}