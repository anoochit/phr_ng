import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phr/app/controllers/app_controller.dart';
import 'package:phr/app/data/models/chart_data.dart';
import 'package:phr/app/data/models/glucose.dart';
import 'package:phr/app/data/models/pressure.dart';

import '../../../data/models/bmi.dart';
import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('history'.tr),
        centerTitle: true,
      ),
      body: GetBuilder<AppController>(
        builder: (controller) {
          var data = [];
          final dataSource = Get.arguments as DataSource;

          final f = NumberFormat('###.0#');

          if (dataSource == DataSource.bmi) {
            data = controller.listBMI.reversed.toList();
          }

          if (dataSource == DataSource.bloodPressure) {
            data = controller.listBloodPressure.reversed.toList();
          }

          if (dataSource == DataSource.bloodGlucose) {
            data = controller.listGlucose.reversed.toList();
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              if (dataSource == DataSource.bmi) {
                Bmi item = data[index];
                final id = item.id;
                final bmi = f.format(item.bmi);
                final status = item.status.name;
                final date = DateFormat("d MMM yyyy").format(item.timestamp);
                final time = DateFormat.Hm().format(item.timestamp);

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      // lead
                      Container(
                        width: 96,
                        height: 96,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // title
                            Text('bmi'.tr),
                            // value
                            Text(
                              bmi,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      const Gap(16.0),
                      // status
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // status
                          Text(status.tr),

                          // date
                          Text(date),

                          // time
                          Text(time),
                        ],
                      ),

                      // button
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          // delete bmi record
                          controller.deleteBmi(id: id);
                        },
                        icon: const Icon(FontAwesomeIcons.circleMinus),
                      )
                    ],
                  ),
                );
              }

              if (dataSource == DataSource.bloodPressure) {
                BloodPressure item = data[index];
                final id = item.id;
                final sys = item.systolic;
                final dia = item.diastolic;
                final status = item.status.name;
                final date = DateFormat("d MMM yyyy").format(item.timestamp);
                final time = DateFormat.Hm().format(item.timestamp);

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      // lead
                      Container(
                        width: 96,
                        height: 96,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // sys
                            Text(
                              '$sys',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24.0),
                              child: Divider(
                                thickness: 2.0,
                                height: 2.0,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                              ),
                            ),
                            // dai
                            Text(
                              '$dia',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      const Gap(16.0),
                      // status
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // status
                          Text(status.tr),

                          // date
                          Text(date),

                          // time
                          Text(time),
                        ],
                      ),

                      // button
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          // delete blood pressure record
                          controller.deleteBloodPressure(id: id);
                        },
                        icon: const Icon(FontAwesomeIcons.circleMinus),
                      )
                    ],
                  ),
                );
              }

              if (dataSource == DataSource.bloodGlucose) {
                Glucose item = data[index];
                final id = item.id;
                final unit = item.unit;
                final status = item.status.name;
                final date = DateFormat("d MMM yyyy").format(item.timestamp);
                final time = DateFormat.Hm().format(item.timestamp);

                return Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      // lead
                      Container(
                        width: 96,
                        height: 96,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // unit
                            Text(
                              '$unit',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),

                            Text('mgdl'.tr),
                          ],
                        ),
                      ),
                      const Gap(16.0),
                      // status
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // status
                          Text(status.tr),

                          // date
                          Text(date),

                          // time
                          Text(time),
                        ],
                      ),

                      // button
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          // delete glucose record
                          controller.deleteGlucose(id: id);
                        },
                        icon: const Icon(FontAwesomeIcons.circleMinus),
                      )
                    ],
                  ),
                );
              }

              return Container();
            },
          );
        },
      ),
    );
  }
}
