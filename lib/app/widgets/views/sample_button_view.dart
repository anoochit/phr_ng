import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/controllers/app_controller.dart';

class SampleButtonView extends GetView<AppController> {
  const SampleButtonView({super.key});
  @override
  Widget build(BuildContext context) {
    return (kDebugMode)
        ? FilledButton.tonal(
            onPressed: () {
              // add sample data
              controller.addSampleData();
            },
            child: const Text('Add sample data'),
          )
        : const SizedBox();
  }
}
