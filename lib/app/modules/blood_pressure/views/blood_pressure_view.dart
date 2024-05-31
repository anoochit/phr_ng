import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/views/history_button_view.dart';
import '../../../widgets/views/stats_card_box_view.dart';
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
      body: ListView(
        children: [
          // stats
          GridView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return StatsCardBoxView(
                title: 'title',
                value: 'value',
                unit: 'unit',
              );
            },
          ),

          // graphs

          // history button
          HistoryButtonView(onTap: () {}),
        ],
      ),
    );
  }
}
