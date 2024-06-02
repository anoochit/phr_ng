import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/app_controller.dart';
import 'stats_box_view.dart';
import 'nodata_stats_view.dart';

class GlucoseStatsView extends GetView<AppController> {
  const GlucoseStatsView({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final listGlucose = controller.listGlucose;

    return Obx(
      () => (listGlucose.isNotEmpty)
          ? Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: (onTap != null) ? () => onTap!() : null,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        "blood_glucose".tr,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),

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
                          // TODO : insert value
                          final label = controller.listGlucoseLabel;
                          return StatsBoxView(
                            title: label[index].title.tr,
                            value: 'value',
                            unit: label[index].unit.tr,
                          );
                        },
                      ),

                      // TODO : graph
                    ],
                  ),
                ),
              ),
            )
          : NodataStatsView(
              title: 'no_data_blood_glucose'.tr,
            ),
    );
  }
}
