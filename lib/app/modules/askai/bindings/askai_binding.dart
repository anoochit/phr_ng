import 'package:get/get.dart';

import '../controllers/askai_controller.dart';

class AskaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AskaiController>(
      () => AskaiController(),
    );
  }
}
