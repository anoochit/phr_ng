import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/views/history_button_view.dart';
import '../../../widgets/views/stats_card_box_view.dart';

class BloodPressureView extends GetView {
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
            icon: const Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
      ),
      body: GetBuilder<AppController>(builder: (controller) {
        return ListView(
          children: [
            // stats
            GridView.builder(
              itemCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                // TODO : add value
                final label = controller.listBloodPressureLabel;

                return StatsCardBoxView(
                  title: label[index].title.tr,
                  value: 'value',
                  unit: label[index].unit.tr,
                );
              },
            ),

            // graphs

            // history button
            HistoryButtonView(onTap: () {}),
          ],
        );
      }),
    );
  }
}
