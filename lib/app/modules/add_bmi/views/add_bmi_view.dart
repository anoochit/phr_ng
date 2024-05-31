import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_bmi_controller.dart';

class AddBmiView extends GetView<AddBmiController> {
  const AddBmiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('add_bmi'.tr),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddBmiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
