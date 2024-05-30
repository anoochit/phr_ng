import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bmi_controller.dart';

class BmiView extends GetView<BmiController> {
  const BmiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('body_mass_index'.tr),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BmiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
