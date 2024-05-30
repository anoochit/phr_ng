import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../widgets/views/stats_box_view.dart';
import 'nodata_stats_view.dart';

class GlucoseStatsView extends GetView<AppController> {
  const GlucoseStatsView({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final listGlucose = controller.listGlucose;

    return Obx(
      () => (listGlucose.isNotEmpty)
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
                        "blood_glucose",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),

                      Gap(16.0),

                      // stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // glucose
                          StatsBoxView(
                            title: 'glucose',
                            value: '0.0',
                            unit: 'mg/dL',
                          ),
                          // a1c
                          StatsBoxView(
                            title: 'a1c',
                            value: '0.0',
                            unit: '%',
                          ),
                        ],
                      ),

                      // graph
                    ],
                  ),
                ),
              ),
            )
          : NodataStatsView(title: 'no_blood_glucose'),
    );
  }
}
