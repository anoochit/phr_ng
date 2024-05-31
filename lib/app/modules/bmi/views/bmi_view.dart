import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/bmi_controller.dart';

class BmiView extends GetView<BmiController> {
  const BmiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('body_mass_index'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.ADD_BMI),
            icon: Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
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
