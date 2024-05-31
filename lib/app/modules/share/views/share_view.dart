import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../widgets/views/bloodpressure_stats_view.dart';
import '../../../widgets/views/bmi_stats_view.dart';
import '../../../widgets/views/glucose_stats_view.dart';
import '../../../widgets/views/profile_avatar_view.dart';

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
                const Gap(8.0),

                // avatar
                ProfileAvatarView(
                  title: name,
                  image: image,
                  backgroundColor:
                      Theme.of(context).colorScheme.onInverseSurface,
                ),

                const Gap(8.0),

                // name
                Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                const Gap(8.0),

                // bmi stats
                const BmiStatsView(),

                const Gap(8.0),

                // blood pressure stats
                const BloodpressureStatsView(),

                const Gap(8.0),

                // blood glucose stats
                const GlucoseStatsView(),

                const Gap(8.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
