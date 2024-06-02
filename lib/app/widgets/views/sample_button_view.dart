import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/controllers/app_controller.dart';

class SampleButtonView extends GetView<AppController> {
  const SampleButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (kDebugMode)
        ? FilledButton.tonal(
            onPressed: () {
              // add sample data
              controller.addSampleData();
            },
            child: Text('Add sample data'),
          )
        : SizedBox();
  }
}
