import 'package:demogetx/ProductModual/Controllers/selecte_services_controller.dart';
import 'package:get/get.dart';

class SelecteServicesBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<SelecteServicesController>(() => SelecteServicesController());
  }
}