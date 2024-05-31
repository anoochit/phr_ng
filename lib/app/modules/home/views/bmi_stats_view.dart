import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../widgets/views/stats_box_view.dart';
import '../../../widgets/views/nodata_stats_view.dart';

class BmiStatsView extends GetView<AppController> {
  const BmiStatsView({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final listBMI = controller.listBMI;

    return Obx(
      () => (listBMI.isNotEmpty)
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
                        'body_mass_index',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),

                      Gap(16.0),

                      // stats
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // weight
                          StatsBoxView(
                            title: 'weight',
                            value: '0.0',
                            unit: 'kg.',
                          ),
                          // height
                          StatsBoxView(
                            title: 'height',
                            value: '0.0',
                            unit: 'cm.',
                          ),
                          // bmi
                          StatsBoxView(
                            title: 'bmi',
                            value: '0.0',
                            unit: 'kg./m^2',
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
              title: 'no_data_body_mass_index'.tr,
            ),
    );
  }
}
