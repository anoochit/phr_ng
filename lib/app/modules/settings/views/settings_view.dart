import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import 'profile_button_view.dart';

class SettingsView extends GetView {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
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
                Gap(16.0),

                // avatar
                ProfileButtonView(
                  title: name,
                  image: image,
                  backgroundColor: Colors.grey,
                  onTap: () {
                    // TODO : Change avatar image
                  },
                ),

                Gap(8.0),

                // name
                Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Gap(16.0),

                // change display name
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('name'.tr),
                  onTap: () {
                    //  TODO : setting display name
                  },
                ),

                // change gender
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('gender'.tr),
                  onTap: () {
                    // TODO : setting gener
                  },
                ),

                // change age
                ListTile(
                  leading: Icon(Icons.person_add),
                  title: Text('age'.tr),
                  onTap: () {
                    // TODO : setting age
                  },
                ),

                // change theme
                ListTile(
                  leading: Icon(Icons.contrast),
                  title: Text('theme'.tr),
                  onTap: () {
                    // TODO : setting theme
                  },
                ),

                // change locale
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('locale'.tr),
                  onTap: () {
                    // TODO :setting locale
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
