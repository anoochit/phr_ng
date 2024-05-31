import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/blood_pressure_controller.dart';

class BloodPressureView extends GetView<BloodPressureController> {
  const BloodPressureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blood_pressure'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.ADD_BLOOD_PRESSURE),
            icon: Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'bloodpressure is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
