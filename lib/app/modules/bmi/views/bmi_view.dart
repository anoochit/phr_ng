import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/widgets/views/history_button_view.dart';
import 'package:phr/app/widgets/views/stats_card_box_view.dart';

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
