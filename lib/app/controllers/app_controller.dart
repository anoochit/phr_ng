import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:phr/app/data/models/setting.dart';
import 'package:phr/app/data/models/stats_label.dart';

import '../data/models/bmi.dart';
import '../data/models/glucose.dart';
import '../data/models/pressure.dart';
import '../data/models/profile.dart';

class AppController extends GetxController {
  RxList<Bmi> listBMI = <Bmi>[].obs;
  RxList<Glucose> listGlucose = <Glucose>[].obs;
  RxList<BloodPressure> listBloodPressure = <BloodPressure>[].obs;

  List<StatsLabel> listBMILabel = <StatsLabel>[
    StatsLabel(title: 'weight', unit: 'kg'),
    StatsLabel(title: 'height', unit: 'cm'),
    StatsLabel(title: 'bmi', unit: 'kgm2'),
  ];

  List<StatsLabel> listBloodPressureLabel = <StatsLabel>[
    StatsLabel(title: 'sys', unit: 'mmhg'),
    StatsLabel(title: 'dia', unit: 'mmhg'),
    StatsLabel(title: 'pul', unit: 'bpm'),
  ];

  List<StatsLabel> listGlucoseLabel = <StatsLabel>[
    StatsLabel(title: 'glucose', unit: 'mgdl'),
    StatsLabel(title: 'a1c', unit: 'percent'),
  ];

  late Profile profile;
  late Setting setting;

  late Isar db;

  loadData() async {
    // load setting data
    await loadSettingData();
    // load another data
    loadProfileData();
    loadBMIData();
    loadBloodPresureData();
    loadGlucoseData();
  }

  // load bmi data
  loadBMIData() {
    db.bmis.where().findAll().then((value) {
      log('load bmi data');
      listBMI.value = value;
      update();
    });
  }

  // load glucose data
  loadGlucoseData() {
    db.glucoses.where().findAll().then((value) {
      log('load glucose data');
      listGlucose.value = value;
      update();
    });
  }

  // load blood presure data
  loadBloodPresureData() {
    db.bloodPressures.where().findAll().then((value) {
      log('load blood presure data');
      listBloodPressure.value = value;
      update();
    });
  }

  // load profile data
  loadProfileData() {
    db.profiles.get(1).then((value) async {
      log('load profile data');
      // no profile data, create a template once
      if (value == null) {
        final data = Profile()
          ..name = 'John Doe'
          ..gender = Gender.male
          ..age = 25
          ..image = ''
          ..id = 1;
        // write default value
        await db.writeTxn(() async {
          await db.profiles.put(data);
        });
        profile = data;
      } else {
        profile = value;
      }
    });

    update();
  }

  // load setting data
  Future<void> loadSettingData() async {
    final value = await db.settings.get(1);
    log('load setting data');
    // no profile data, create a template once
    if (value == null) {
      final data = Setting()
        ..theme = ThemeStatus.dark
        ..locale = LocaleStatus.enUS;
      // write default value
      await db.writeTxn(() async {
        await db.settings.put(data);
        setting = data;
      });
    } else {
      setting = value;
    }

    update(['setting']);
  }

  // get theme title
  String getThemeTitle(ThemeStatus theme) {
    switch (theme) {
      case ThemeStatus.dark:
        return 'dark';

      case ThemeStatus.light:
        return 'light';

      case ThemeStatus.system:
        return 'system';

      default:
        return 'dark';
    }
  }

  // get theme value
  ThemeMode getThemeValue() {
    switch (setting.theme) {
      case ThemeStatus.dark:
        return ThemeMode.dark;
      case ThemeStatus.light:
        return ThemeMode.light;
      case ThemeStatus.system:
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  // get locale value
  String getLocaleValue() {
    final locale = setting.locale;
    return '${locale.name.substring(0, 2)}_${locale.name.substring(2, 4)}';
  }

  // get local title
  String getLocaleTitle(LocaleStatus locale) {
    switch (locale) {
      case LocaleStatus.enUS:
        return 'english';
      case LocaleStatus.thTH:
        return 'thai';
      default:
        return 'english';
    }
  }

  // get gender title
  String getGenderTitle(Gender gender) {
    switch (gender) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      default:
        return 'other';
    }
  }

  // save theme setting
  saveThemeSetting(ThemeStatus theme) async {
    // save setting storage
    final data = await db.settings.get(1);
    // write default value
    await db.writeTxn(() async {
      data!.theme = theme;
      await db.settings.put(data);
      setting = data;
      Get.changeThemeMode(getThemeValue());
      update();
    });
  }

  // save locale setting
  saveLocaleSetting(LocaleStatus locale) async {
    // save setting storage
    final data = await db.settings.get(1);
    // write default value
    await db.writeTxn(() async {
      data!.locale = locale;
      await db.settings.put(data);
      setting = data;
      Get.updateLocale(Locale(getLocaleValue()));
      update();
    });
  }

  // save age
  saveAge({required int age}) async {
    // save setting storage
    final user = await db.profiles.get(1);
    // write default value
    await db.writeTxn(() async {
      user!.age = age;
      await db.profiles.put(user);
      profile = user;
      update();
    });
  }

  // save gender
  saveGender({required Gender gender}) async {
    // save setting storage
    final user = await db.profiles.get(1);
    // write default value
    await db.writeTxn(() async {
      user!.gender = gender;
      await db.profiles.put(user);
      profile = user;
      update();
    });
  }

  // save name
  saveName({required String name}) async {
    // save setting storage
    final user = await db.profiles.get(1);
    // write default value
    await db.writeTxn(() async {
      user!.name = name;
      await db.profiles.put(user);
      profile = user;
      update();
    });
  }
}
