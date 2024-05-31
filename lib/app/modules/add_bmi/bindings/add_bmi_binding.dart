import 'package:get/get.dart';

import '../controllers/add_bmi_controller.dart';

class AddBmiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBmiController>(
      () => AddBmiController(),
    );
  }
}
