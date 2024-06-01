import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../../../controllers/app_controller.dart';
import '../../../data/models/profile.dart';
import '../../../data/models/setting.dart';
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
          final setting = controller.setting;
          String image = profile.image;
          String name = profile.name;
          String theme = controller.getThemeTitle(setting.theme);
          String locale = controller.getLocaleTitle(setting.locale);
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
                  onTap: () => buildNameSettingDialog(
                    context,
                    controller,
                    name,
                  ),
                  trailing: Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change gender
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('gender'.tr),
                  onTap: () => buildGenderSettingDialog(
                    context,
                    controller,
                    profile.gender,
                  ),
                  trailing: Text(
                    gender.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change age
                ListTile(
                  leading: const Icon(Icons.person_add),
                  title: Text('age'.tr),
                  onTap: () => buildAgeSettingDialog(
                    context,
                    controller,
                    profile.age,
                  ),
                  trailing: Text(
                    age,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change theme
                ListTile(
                  leading: const Icon(Icons.contrast),
                  title: Text('theme'.tr),
                  onTap: () => buildThemeSettingDialog(
                    context,
                    controller,
                    setting.theme,
                  ),
                  trailing: Text(
                    theme.tr,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),

                // change locale
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text('locale'.tr),
                  onTap: () => buildLocaleSettingDialog(
                    context,
                    controller,
                    setting.locale,
                  ),
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

  // show name setting dialog
  buildNameSettingDialog(
    BuildContext context,
    AppController controller,
    String name,
  ) {
    //  TODO : setting display name
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController textEditingController = TextEditingController();
        textEditingController.text = name;
        return AlertDialog(
          title: Text('name'.tr),
          content: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'name'.tr,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                controller.saveName(
                  name: textEditingController.text,
                );
                Get.back();
              },
              child: Text('save'.tr),
            )
          ],
        );
      },
    );
  }

  // show gender setting dialog
  buildGenderSettingDialog(
    BuildContext context,
    AppController controller,
    Gender gender,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('gender'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(Gender.values.length, (index) {
              return SizedBox(
                width: Get.width,
                child: TextButton(
                  onPressed: () {
                    // save gender
                    controller.saveGender(gender: Gender.values[index]);
                    Get.back();
                  },
                  child: Text(
                    controller.getGenderTitle(Gender.values[index]).tr,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  // show age setting dialog
  buildAgeSettingDialog(
    BuildContext context,
    AppController controller,
    int age,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController textEditingController = TextEditingController();
        textEditingController.text = '$age';
        return AlertDialog(
          title: Text('age'.tr),
          content: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'age'.tr,
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                controller.saveAge(
                  age: int.parse(textEditingController.text),
                );
                Get.back();
              },
              child: Text('save'.tr),
            )
          ],
        );
      },
    );
  }

  buildThemeSettingDialog(
    BuildContext context,
    AppController controller,
    ThemeStatus theme,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('theme'.tr),
          content: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(ThemeStatus.values.length, (index) {
              return SizedBox(
                width: Get.width,
                child: TextButton(
                  onPressed: () {
                    // save theme
                    controller.saveThemeSetting(ThemeStatus.values[index]);
                    Get.back();
                  },
                  child: Text(
                    controller.getThemeTitle(ThemeStatus.values[index]).tr,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  buildLocaleSettingDialog(
    BuildContext context,
    AppController controller,
    LocaleStatus locale,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('locale'.tr),
          content: Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(LocaleStatus.values.length, (index) {
              return SizedBox(
                width: Get.width,
                child: TextButton(
                  onPressed: () {
                    // save theme
                    controller.saveLocaleSetting(LocaleStatus.values[index]);
                    Get.back();
                  },
                  child: Text(
                    controller.getLocaleTitle(LocaleStatus.values[index]).tr,
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
