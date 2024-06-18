import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phr/app/data/models/chart_data.dart';
import 'package:phr/app/widgets/views/graph_box_view.dart';
import 'package:phr/app/widgets/views/result_box_view.dart';

import '../../../controllers/app_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/views/history_button_view.dart';
import '../../../widgets/views/nodata_stats_view.dart';
import '../../../widgets/views/stats_card_box_view.dart';

class BmiView extends GetView {
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
            icon: const Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
      ),
      body: GetBuilder<AppController>(
        builder: (controller) {
          return (controller.listBMI.isNotEmpty)
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
                        // add value
                        final label = controller.listBMILabel;
                        final item = controller.listBMI.last;
                        final f = NumberFormat('##.0#');

                        // bug when null
                        double? value = (index == 0)
                            ? item.weight
                            : (index == 1)
                                ? item.height
                                : item.bmi;

                        return StatsCardBoxView(
                          title: label[index].title.tr,
                          value: f.format(value),
                          unit: label[index].unit.tr,
                        );
                      },
                    ),

                    // add result
                    ResultBoxView(
                      title: 'result'.tr,
                      value: controller.listBMI.last.status.name.tr,
                    ),

                    // add graphs
                    GraphBoxView(
                      title: 'statistic'.tr,
                      data: DataSource.bmi,
                    ),

                    // add history button
                    HistoryButtonView(
                      onTap: () => Get.toNamed(
                        Routes.HISTORY,
                        arguments: DataSource.bmi,
                      ),
                    ),
                  ],
                )
              : NodataStatsView(
                  title: 'no_data_blood_pressure'.tr,
                );
        },
      ),
    );
  }
}
