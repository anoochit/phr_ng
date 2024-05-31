import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/routes/app_pages.dart';

import '../controllers/blood_glucose_controller.dart';

class BloodGlucoseView extends GetView<BloodGlucoseController> {
  const BloodGlucoseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blood_glucose'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.ADD_BLOOD_GLUCOSE),
            icon: Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text(
          'BloodGlucoseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
