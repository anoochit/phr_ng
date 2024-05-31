import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/routes/app_pages.dart';

import '../../../widgets/views/history_button_view.dart';
import '../../../widgets/views/stats_card_box_view.dart';
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
      body: ListView(
        children: [
          // stats
          GridView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
            ),
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
