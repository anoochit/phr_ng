import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../../../controllers/app_controller.dart';
import '../../../widgets/views/bloodpressure_stats_view.dart';
import '../../../widgets/views/bmi_stats_view.dart';
import '../../../widgets/views/glucose_stats_view.dart';
import '../../../widgets/views/profile_avatar_view.dart';

class ShareView extends GetView {
  ShareView({super.key});

  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('share'.tr),
        centerTitle: true,
        actions: shareIconButton,
      ),
      body: GetBuilder<AppController>(
        builder: (controller) {
          final profile = controller.profile;
          final image = Uint8List.fromList(profile.image);
          final name = profile.name;

          return Screenshot(
            controller: screenshotController,
            child: Container(
              color: Theme.of(context).canvasColor,
              child: SingleChildScrollView(
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

                    // blood pressure stats
                    const BloodpressureStatsView(),

                    // blood glucose stats
                    const GlucoseStatsView(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Widget> get shareIconButton {
    return [
      IconButton(
        onPressed: () async {
          // share
          final image = await screenshotController.capture(
            delay: const Duration(milliseconds: 200),
          );

          if (image != null) {
            // save image to gallery
            await ImageGallerySaver.saveImage(image);
            // share
            Share.shareXFiles(
              [
                XFile.fromData(image, mimeType: 'image/png'),
              ],
            );
          }
        },
        icon: const Icon(Icons.share),
      ),
    ];
  }
}
