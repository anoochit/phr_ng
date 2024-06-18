import 'package:flutter/material.dart';

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

    dateTextController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    timeTextController.text = DateFormat('h:mm:00').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('add_bmi'.tr),
        centerTitle: true,
      ),
      body: ListView(
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
              prefixIcon: Icon(Icons.calendar_month),
            ),
            onTap: () async {
              // date picker
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime.now().subtract(Duration(days: 30)),
                lastDate: DateTime.now(),
                initialDatePickerMode: DatePickerMode.day,
                initialEntryMode: DatePickerEntryMode.calendarOnly,
              );

              dateTextController.text =
                  DateFormat('yyyy-MM-dd').format(date!).toString();
            },
          ),

          // time
          TextFormField(
            controller: timeTextController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: 'select_time'.tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: Icon(Icons.schedule),
            ),
            onTap: () async {
              // time picker
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.dialOnly,
                builder: (context, child) {
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

          // weight
          TextFormField(
            controller: weightTextController,
            decoration: InputDecoration(
              hintText: 'enter_weight_kg'.tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: Icon(Icons.monitor_weight_outlined),
            ),
            keyboardType: TextInputType.number,
          ),

          // height
          TextFormField(
            controller: heightTextController,
            decoration: InputDecoration(
              hintText: 'enter_height_cm'.tr,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: Icon(Icons.emoji_people),
            ),
            keyboardType: TextInputType.number,
          ),

          // save button
          FilledButton(
            onPressed: () {
              // save
              final weightString = weightTextController.text.trim();
              final heightString = heightTextController.text.trim();
              if (weightString.isNotEmpty && heightString.isNotEmpty) {
                final dateTimeString =
                    '${dateTextController.text} ${timeTextController.text}';
                final timeStamp =
                    DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTimeString);

                final weight = double.parse(weightString);
                final height = double.parse(heightString);

                // save to database
                controller.addBmi(
                  timestamp: timeStamp,
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
    );
  }
}
