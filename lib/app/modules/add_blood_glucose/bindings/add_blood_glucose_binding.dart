import 'package:get/get.dart';

import '../controllers/add_blood_glucose_controller.dart';

class AddBloodGlucoseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddBloodGlucoseController>(
      () => AddBloodGlucoseController(),
    );
  }
}
