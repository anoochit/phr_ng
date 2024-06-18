import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phr/app/controllers/app_controller.dart';

class AddBmiView extends GetView<AppController> {
  const AddBmiView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dateTextController = TextEditingController();
    TextEditingController timeTextController = TextEditingController();
    TextEditingController weightTextController = TextEditingController();
    TextEditingController heightTextController = TextEditingController();

    dateTextController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
    timeTextController.text = DateFormat("h:mm:00").format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('add_bmi'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ListView(
          children: [
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

            // weight
            TextFormField(
              controller: weightTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.monitor_weight_outlined),
                hintText: 'enter_weight_kg'.tr,
              ),
              keyboardType: TextInputType.number,
            ),
            const Gap(8.0),

            // height
            TextFormField(
              controller: heightTextController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                prefixIcon: const Icon(Icons.emoji_people),
                hintText: 'enter_height_cm'.tr,
              ),
              keyboardType: TextInputType.number,
            ),
            const Gap(8.0),

            // button
            FilledButton(
              onPressed: () {
                final weightString = weightTextController.text.trim();
                final heightString = heightTextController.text.trim();

                if (weightString.isNotEmpty && heightString.isNotEmpty) {
                  // parse timestamp
                  final dateTimeString =
                      '${dateTextController.text} ${timeTextController.text}';
                  final timestamp =
                      DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTimeString);

                  // extract value
                  final weight = double.parse(weightString);
                  final height = double.parse(heightString);

                  // save
                  controller.addBmi(
                    timestamp: timestamp,
                    weight: weight,
                    height: height,
                  );

                  Get.back();
                } else {
                  Get.snackbar('error'.tr, 'please_enter_weight_height'.tr);
                }
              },
              child: Text('save'.tr),
            )
          ],
        ),
      ),
    );
  }
}
