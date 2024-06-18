import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../data/models/chart_data.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/views/graph_box_view.dart';
import '../../../widgets/views/history_button_view.dart';
import '../../../widgets/views/nodata_stats_view.dart';
import '../../../widgets/views/result_box_view.dart';
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
        return (controller.listBloodPressure.isNotEmpty)
            ? ListView(
                children: [
                  // stats
                  GridView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      //  add value
                      final label = controller.listBloodPressureLabel;
                      final item = controller.listBloodPressure.last;

                      int? value = (index == 0)
                          ? item.systolic
                          : (index == 1)
                              ? item.diastolic
                              : item.pulse;

                      return StatsCardBoxView(
                        title: label[index].title.tr,
                        value: '$value',
                        unit: label[index].unit.tr,
                      );
                    },
                  ),

                  // add result
                  ResultBoxView(
                    title: 'result'.tr,
                    value: controller.listBloodPressure.last.status.name.tr,
                  ),

                  // add graphs
                  GraphBoxView(
                    title: 'statistic'.tr,
                    data: DataSource.bloodPressure,
                  ),

                  // add history button
                  HistoryButtonView(
                    onTap: () => Get.toNamed(
                      Routes.HISTORY,
                      arguments: DataSource.bloodPressure,
                    ),
                  ),
                ],
              )
            : NodataStatsView(
                title: 'no_data_blood_pressure'.tr,
              );
      }),
    );
  }
}
