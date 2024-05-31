import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../widgets/views/profile_button_view.dart';

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
          String image = profile.image;
          String name = profile.name;
          String theme = controller.getThemeTitle(profile.theme);
          String locale = controller.getLocaleTitle(profile.locale);
          String gender = controller.getGenderTitle(profile.gender);
          String age = '${profile.age}';
          return SingleChildScrollView(
            child: Column(
              children: [
                const Gap(16.0),

                // avatar
                ProfileAvatarButtonView(
                  title: name,
                  image: image,
                  backgroundColor:
                      Theme.of(context).colorScheme.onInverseSurface,
                  onTap: () {
                    // TODO : Change avatar image
                  },
                ),

                const Gap(8.0),

                // name
                Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                const Gap(16.0),

                // change display name
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: Text('name'.tr),
                  onTap: () {
                    //  TODO : setting display name
                  },
                  trailing: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change gender
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('gender'.tr),
                  onTap: () {
                    // TODO : setting gener
                  },
                  trailing: Text(
                    gender,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change age
                ListTile(
                  leading: const Icon(Icons.person_add),
                  title: Text('age'.tr),
                  onTap: () {
                    // TODO : setting age
                  },
                  trailing: Text(
                    age,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change theme
                ListTile(
                  leading: const Icon(Icons.contrast),
                  title: Text('theme'.tr),
                  onTap: () {
                    // TODO : setting theme
                  },
                  trailing: Text(
                    theme.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change locale
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text('locale'.tr),
                  onTap: () {
                    // TODO :setting locale
                  },
                  trailing: Text(
                    locale.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
