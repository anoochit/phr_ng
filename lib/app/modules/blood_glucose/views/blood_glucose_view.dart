import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/blood_glucose_controller.dart';

class BloodGlucoseView extends GetView<BloodGlucoseController> {
  const BloodGlucoseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('blood_glucose'.tr),
        centerTitle: true,
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
