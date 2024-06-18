import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controllers/app_controller.dart';

class AddBloodPressureView extends GetView<AppController> {
  const AddBloodPressureView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController dateTextController = TextEditingController();
    TextEditingController timeTextController = TextEditingController();
    TextEditingController sysTextController = TextEditingController();
    TextEditingController diaTextController = TextEditingController();
    TextEditingController pulTextController = TextEditingController();

    dateTextController.text = DateFormat("yyyy-MM-dd").format(DateTime.now());
    timeTextController.text = DateFormat("h:mm:00").format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Text('add_blood_pressure'.tr),
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

          // sys
          TextFormField(
            controller: sysTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.favorite_outline),
              hintText: 'enter_sys_mmhg'.tr,
            ),
            keyboardType: TextInputType.number,
          ),
          const Gap(8.0),

          // dia
          TextFormField(
            controller: diaTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.favorite_outline),
              hintText: 'enter_dia_mmhg'.tr,
            ),
            keyboardType: TextInputType.number,
          ),
          const Gap(8.0),

          // pul
          TextFormField(
            controller: pulTextController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              prefixIcon: const Icon(Icons.favorite_outline),
              hintText: 'enter_pul_bpm'.tr,
            ),
            keyboardType: TextInputType.number,
          ),
          const Gap(8.0),

          // button
          FilledButton(
            onPressed: () {
              String sysString = sysTextController.text.trim();
              String diaString = diaTextController.text.trim();

              String pulString = pulTextController.text.trim();

              if (sysString.isNotEmpty &&
                  diaString.isNotEmpty &&
                  pulString.isNotEmpty) {
                // parse timestamp
                final dateTimeString =
                    '${dateTextController.text} ${timeTextController.text}';
                final timestamp =
                    DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateTimeString);

                // extract value
                final sys = int.parse(sysString);
                final dia = int.parse(diaString);
                final pul = int.parse(pulString);

                // save
                controller.addBloodPressure(
                  timestamp: timestamp,
                  sys: sys,
                  dia: dia,
                  pul: pul,
                );

                Get.back();
              } else {
                Get.snackbar('error'.tr, 'please_enter_sys_dia_pul'.tr);
              }
            },
            child: Text('save'.tr),
          )
        ]),
      ),
    );
  }
}
