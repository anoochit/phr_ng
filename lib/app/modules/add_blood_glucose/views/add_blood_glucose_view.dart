import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_blood_glucose_controller.dart';

class AddBloodGlucoseView extends GetView<AddBloodGlucoseController> {
  const AddBloodGlucoseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_blood_glucose'.tr),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddBloodGlucoseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
