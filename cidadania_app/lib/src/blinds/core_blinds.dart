import 'package:cidadania_app/src/controllers/business_controller.dart';
import 'package:get/get.dart';

class CoreBlinds implements Bindings {
  @override
  void dependencies() {
     Get.put<BusinessController>(BusinessController(), permanent: true);
  }

}