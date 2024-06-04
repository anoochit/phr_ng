import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phr/app/widgets/views/nodata_stats_view.dart';

import '../../../controllers/app_controller.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/views/graph_box_view.dart';
import '../../../widgets/views/history_button_view.dart';
import '../../../widgets/views/result_box_view.dart';
import '../../../widgets/views/stats_card_box_view.dart';

class BloodGlucoseView extends GetView {
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
            icon: const Icon(
              Icons.add,
              size: 28,
            ),
          )
        ],
      ),
      body: GetBuilder<AppController>(
        builder: (controller) {
          return (controller.listGlucose.isNotEmpty)
              ? ListView(
                  children: [
                    // stats
                    GridView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 2,
                      ),
                      itemBuilder: (context, index) {
                        // TODO : add value
                        final label = controller.listGlucoseLabel;
                        final item = controller.listGlucose.last;
                        final f = NumberFormat('##.0#');
                        final value = (index == 0)
                            ? item.unit
                            : (index == 1)
                                ? item.a1c
                                : null;

                        return StatsCardBoxView(
                          title: label[index].title.tr,
                          value: f.format(value),
                          unit: label[index].unit.tr,
                        );
                      },
                    ),

                    // TODO : add result
                    ResultBoxView(
                      title: 'result'.tr,
                      value: 'value',
                    ),

                    // TODO : add graphs
                    GraphBoxView(),

                    // TODO : add history button
                    HistoryButtonView(onTap: () {}),
                  ],
                )
              : Container(
                  child: NodataStatsView(
                    title: 'no_data_blood_glucose'.tr,
                  ),
                );
        },
      ),
    );
  }
}
