import 'package:get/get.dart';

import '../controllers/blood_glucose_controller.dart';

class BloodGlucoseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BloodGlucoseController>(
      () => BloodGlucoseController(),
    );
  }
}
