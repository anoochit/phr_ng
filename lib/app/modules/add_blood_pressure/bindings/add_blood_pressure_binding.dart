import 'package:get/get.dart';

import '../controllers/add_blood_pressure_controller.dart';

class AddBloodPressureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBloodPressureController>(
      () => AddBloodPressureController(),
    );
  }
}
