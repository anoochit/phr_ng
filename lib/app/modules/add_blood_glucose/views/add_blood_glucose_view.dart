import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/app_controller.dart';
import '../../../data/models/glucose.dart';

class AddBloodGlucoseView extends GetView<AppController> {
  const AddBloodGlucoseView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateTextController = TextEditingController();
    TextEditingController timeTextController = TextEditingController();
    TextEditingController glucoseTextController = TextEditingController();

    dateTextController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
    timeTextController.text = DateFormat("h:mm:00").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('add_blood_glucose'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ListView(children: [
          // date
          TextFormField(
            controller: dateTextController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'select_date'.tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.today),
            ),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now().subtract(
                  const Duration(days: 30),
                ),
                initialDatePickerMode: DatePickerMode.day,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
                lastDate: DateTime.now(),
                initialDate: DateTime.now(),
              );

              dateTextController.text =
                  DateFormat('yyyy-MM-dd').format(date!).toString();
            },
          ),
          const Gap(8.0),

          // time
          TextFormField(
            controller: timeTextController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'select_time'.tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.schedule),
            ),
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (BuildContext context, Widget? child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child!,
                  );
                },
              );

              timeTextController.text = '${time!.hour}:${time.minute}:00';
            },
          ),
          const Gap(8.0),

          // gluecose
          TextFormField(
            controller: glucoseTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.monitor_weight_outlined),
              hintText: 'enter_glucose_mgdl'.tr,
            ),
            keyboardType: TextInputType.number,
          ),
          const Gap(8.0),

          GetBuilder<AppController>(
              id: 'radio',
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).unselectedWidgetColor),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: MeasureAt.fasting,
                            groupValue: controller.measureAt,
                            onChanged: (value) {
                              controller.measureAt = value!;
                              controller.update(['radio']);
                            },
                          ),
                          Text(MeasureAt.fasting.name.tr)
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: MeasureAt.afterEating,
                            groupValue: controller.measureAt,
                            onChanged: (value) {
                              controller.measureAt = value!;
                              controller.update(['radio']);
                            },
                          ),
                          Text(MeasureAt.afterEating.name.tr)
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: MeasureAt.afterEating23hr,
                            groupValue: controller.measureAt,
                            onChanged: (value) {
                              controller.measureAt = value!;
                              controller.update(['radio']);
                            },
                          ),
                          Text(MeasureAt.afterEating23hr.name.tr)
                        ],
                      ),
                    ],
                  ),
                );
              }),
          const Gap(8.0),

          // button
          FilledButton(
            onPressed: () {
              final glucoseString = glucoseTextController.text.trim();

              if (glucoseString.isNotEmpty) {
                // parse timestamp
                final dateTimeString =
                    '${dateTextController.text} ${timeTextController.text}';
                final timestamp =
                    DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTimeString);

                // extract value
                final glucose = int.parse(glucoseString);
                final measureAt = controller.measureAt;

                // save
                controller.addBloodGlucose(
                  timestamp: timestamp,
                  glucose: glucose,
                  meadureAt: measureAt,
                );

                Get.back();
              } else {
                Get.snackbar('error'.tr, 'please_enter_glucose'.tr);
              }
            },
            child: Text('save'.tr),
          )
        ]),
      ),
    );
  }
}
