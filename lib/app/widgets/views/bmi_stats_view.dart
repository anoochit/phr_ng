import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

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
      () => (!listBMI.isNotEmpty)
          ? Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: (onTap != null) ? () => onTap!() : null,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // title
                      Text(
                        'body_mass_index'.tr,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),

                      Gap(16.0),

                      // stats
                      GridView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          return StatsBoxView(
                            title: 'title',
                            value: 'value',
                            unit: 'unit',
                          );
                        },
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
