import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:phr/app/controllers/app_controller.dart';
import 'package:phr/app/modules/blood_glucose/views/blood_glucose_view.dart';
import 'package:phr/app/widgets/views/bloodpressure_stats_view.dart';
import 'package:phr/app/widgets/views/bmi_stats_view.dart';

import '../../../widgets/views/glucose_stats_view.dart';
import '../../../widgets/views/profile_avatar_view.dart';
import '../../../widgets/views/profile_button_view.dart';
import '../controllers/share_controller.dart';

class ShareView extends GetView {
  const ShareView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('share'.tr),
        centerTitle: true,
      ),
      body: GetBuilder<AppController>(
        builder: (controller) {
          final profile = controller.profile;
          final image = profile.image;
          final name = profile.name;
          final theme = profile.theme;
          final locale = profile.locale;
          return SingleChildScrollView(
            child: Column(
              children: [
                // avatar
                ProfileAvatarView(
                  title: name,
                  image: image,
                  backgroundColor:
                      Theme.of(context).colorScheme.onInverseSurface,
                ),

                Gap(8.0),

                // name
                Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                // bmi stats
                BmiStatsView(),

                // blood pressure stats
                BloodpressureStatsView(),

                // blood glucose stats
                GlucoseStatsView()
              ],
            ),
          );
        },
      ),
    );
  }
}
