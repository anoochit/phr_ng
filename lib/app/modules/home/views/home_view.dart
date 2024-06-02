import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/controllers/app_controller.dart';
import 'package:phr/app/routes/app_pages.dart';
import 'package:phr/app/widgets/views/sample_button_view.dart';
import '../controllers/home_controller.dart';
import '../../../widgets/views/bloodpressure_stats_view.dart';
import '../../../widgets/views/bmi_stats_view.dart';
import '../../../widgets/views/glucose_stats_view.dart';
import 'menu_view.dart';

class HomeView extends GetView {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        centerTitle: false,
        actions: buildPopupMenu,
      ),
      body: GetBuilder<AppController>(
        builder: (context) {
          return ListView(
            children: [
              // menu
              MenuView(),

              // TODO : show add sample data only in debug mode

              // bmi stats with graph
              BmiStatsView(
                onTap: () => Get.toNamed(Routes.BMI),
              ),

              // blood pressure
              BloodpressureStatsView(
                onTap: () => Get.toNamed(Routes.BLOOD_PRESSURE),
              ),

              // blood glucose
              GlucoseStatsView(
                onTap: () => Get.toNamed(Routes.BLOOD_GLUCOSE),
              )
            ],
          );
        },
      ),
    );
  }

  List<Widget> get buildPopupMenu {
    return [
      PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text('settings'.tr),
            onTap: () {
              // open profile setting
              Get.toNamed(Routes.SETTINGS);
            },
          ),
          PopupMenuItem(
            child: Text('share'.tr),
            onTap: () {
              // open share
              Get.toNamed(Routes.SHARE);
            },
          )
        ],
      )
    ];
  }
}
