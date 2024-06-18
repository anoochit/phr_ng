import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/app_controller.dart';
import 'stats_box_view.dart';
import 'nodata_stats_view.dart';

class BmiStatsView extends GetView<AppController> {
  const BmiStatsView({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final listBMI = controller.listBMI;

    return Obx(
      () => (listBMI.isNotEmpty)
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
                            'body_mass_index'.tr,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(controller.listBMI.last.status.name.tr)
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
                          final label = controller.listBMILabel;
                          final item = controller.listBMI.last;
                          final f = NumberFormat('##.0#');

                          // bug when null
                          double? value = (index == 0)
                              ? item.weight
                              : (index == 1)
                                  ? item.height
                                  : item.bmi;

                          return StatsBoxView(
                            title: label[index].title.tr,
                            value: f.format(value),
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
              title: 'no_data_body_mass_index'.tr,
            ),
    );
  }
}
