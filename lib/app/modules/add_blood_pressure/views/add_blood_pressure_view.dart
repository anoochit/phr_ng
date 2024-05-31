import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_blood_pressure_controller.dart';

class AddBloodPressureView extends GetView<AddBloodPressureController> {
  const AddBloodPressureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_blood_pressure'.tr),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddBloodPressureView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
