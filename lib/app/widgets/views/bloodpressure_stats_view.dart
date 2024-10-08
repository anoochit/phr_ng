import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/app_controller.dart';
import 'stats_box_view.dart';
import 'nodata_stats_view.dart';

class BloodpressureStatsView extends GetView<AppController> {
  const BloodpressureStatsView({super.key, this.onTap});

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.listBloodPressure.isNotEmpty)
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'blood_pressure'.tr,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(controller.listBloodPressure.last.status.name.tr)
                        ],
                      ),

                      // stats
                      GridView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          // insert value
                          final label = controller.listBloodPressureLabel;
                          final item = controller.listBloodPressure.last;

                          // bug when null
                          int? value = (index == 0)
                              ? item.systolic
                              : (index == 1)
                                  ? item.diastolic
                                  : item.pulse;

                          return StatsBoxView(
                            title: label[index].title.tr,
                            value: '$value',
                            unit: label[index].unit.tr,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : NodataStatsView(
              title: 'no_data_blood_pressure'.tr,
            ),
    );
  }
}
