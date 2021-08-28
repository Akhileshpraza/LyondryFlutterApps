
import 'package:demogetx/ProductModual/Controllers/add_address_controller.dart';
import 'package:get/get.dart';

class InsertAddressBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<AddAddressController>(() => AddAddressController());
  }
}