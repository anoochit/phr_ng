import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../widgets/views/stats_box_view.dart';
import 'nodata_stats_view.dart';

class BloodpressureStatsView extends GetView<AppController> {
  const BloodpressureStatsView({super.key, required this.onTap});

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final listBloodPressure = controller.listBloodPressure;
    return Obx(
      () => (listBloodPressure.isNotEmpty)
          ? Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => onTap(),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        'blood_pressure',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),

                      Gap(16.0),

                      // stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // sys
                          StatsBoxView(
                            title: 'sys',
                            value: '0.0',
                            unit: 'units',
                          ),
                          // dia
                          StatsBoxView(
                            title: 'dia',
                            value: '0.0',
                            unit: 'units',
                          ),
                          // pul
                          StatsBoxView(
                            title: 'pul',
                            value: '0.0',
                            unit: 'units',
                          ),
                        ],
                      ),

                      // graph
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
