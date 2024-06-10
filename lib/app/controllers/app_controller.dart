import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:phr/app/data/models/setting.dart';
import 'package:phr/app/data/models/stats_label.dart';

import '../data/models/bmi.dart';
import '../data/models/glucose.dart';
import '../data/models/menu_item.dart';
import '../data/models/pressure.dart';
import '../data/models/profile.dart';
import '../routes/app_pages.dart';

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

  List<MenuItem> menuItems = [
    MenuItem(
      icon: FontAwesomeIcons.weightScale,
      title: 'body_mass_index',
      route: Routes.BMI,
    ),
    MenuItem(
      icon: FontAwesomeIcons.heartPulse,
      title: 'blood_pressure',
      route: Routes.BLOOD_PRESSURE,
    ),
    MenuItem(
      icon: FontAwesomeIcons.candyCane,
      title: 'blood_glucose',
      route: Routes.BLOOD_GLUCOSE,
    ),
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
          ..image = []
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

  // convert xfile to list of int
  Future<List<int>> convertXFileToList(XFile xFile) async {
    final bytes = await xFile.readAsBytes();
    return bytes.toList();
  }

  // save avatar
  saveAvatar({required XFile xfile}) async {
    List<int> image = await convertXFileToList(xfile);

    // save setting storage
    final user = await db.profiles.get(1);
    // write default value
    await db.writeTxn(() async {
      user!.image = image;
      await db.profiles.put(user);
      profile = user;
      update();
    });
  }

  // bmi level
  // - Underweight = <18.5
  // - Normal weight = 18.5–24.9
  // - Overweight = 25–29.9
  // - Obesity = BMI of 30 or greater
  BmiStatus bmiLevel({required double bmi}) {
    if (bmi < 18.5) {
      log("bmi status -> 0");
      return BmiStatus.underWeight;
    } else if ((bmi >= 18.5) && (bmi <= 24.9)) {
      log("bmi status -> 1");
      return BmiStatus.normalWeight;
    } else if ((bmi >= 25) && (bmi <= 29.9)) {
      log("bmi status -> 2");
      return BmiStatus.overWeight;
    } else {
      log("bmi status -> 3");
      return BmiStatus.obesity;
    }
  }

  // bmi calculation
  double bmiCalculation({required double weight, required double height}) {
    double bmi = weight / math.pow((height / 100), 2);
    log("bmi value -> $bmi");
    return bmi;
  }

  // blood pressure calculation
  // 0 - hypo
  // 1 - normal
  // 2 - pre-hyper
  // 3 - hyper state 1
  // 4 - hyper state 2
  BloodPresureStatus bloodPressureCalculation(
      {required int systolic, required int diastolic}) {
    log("$systolic/$diastolic");
    if ((systolic <= 90) && (diastolic <= 60)) {
      log("bp status -> 0");
      return BloodPresureStatus.hypo;
    } else if ((systolic <= 120) && (diastolic <= 80)) {
      log("bp status -> 1");
      return BloodPresureStatus.normal;
    } else if ((systolic <= 140) && (diastolic <= 90)) {
      log("bp status -> 2");
      return BloodPresureStatus.preHyper;
    } else if ((systolic <= 160) && (diastolic <= 100)) {
      log("bp status -> 3");
      return BloodPresureStatus.hyperState1;
    } else {
      log("bp status -> 4");
      return BloodPresureStatus.hyperState2;
    }
  }

  // calculate glucose level
  // ref
  //  - https://www.lark.com/blog/blood-sugar-chart/
  //  - https://ebmcalc.com/GlycemicAssessment.htm
  //
  // 0 = fasting, 1 = After Eating, 2 = 2-3 After Eating
  GlucoseStatus glucoseCalculation(
      {required MeasureAt measureAt, required int unit}) {
    // calculate fasting
    if (measureAt == MeasureAt.fasting) {
      if ((unit >= 80) && (unit <= 100)) {
        // normal
        return GlucoseStatus.normal;
      } else if ((unit >= 101) && (unit <= 125)) {
        // impaired
        return GlucoseStatus.impaired;
      } else if (unit >= 126) {
        // diabetic
        return GlucoseStatus.diabetic;
      } else {
        // unknow
        return GlucoseStatus.unknow;
      }
    }

    // calculate after eating
    if (measureAt == MeasureAt.afterEating) {
      //if ((unit >= 170) && (unit <= 200)) {
      if ((unit >= 80) && (unit <= 200)) {
        // normal
        return GlucoseStatus.normal;
      } else if ((unit >= 190) && (unit <= 230)) {
        // impaired
        return GlucoseStatus.impaired;
      } else if ((unit >= 220)) {
        // diabetic
        return GlucoseStatus.diabetic;
      } else {
        // unknow
        return GlucoseStatus.unknow;
      }
    }

    // calculate 2-3 hrs after eating
    if (measureAt == MeasureAt.afterEating23hr) {
      //if ((unit >= 120) && (unit <= 140)) {
      if ((unit >= 80) && (unit <= 140)) {
        // normal
        return GlucoseStatus.normal;
      } else if ((unit >= 140) && (unit <= 200)) {
        // impaired
        return GlucoseStatus.impaired;
      } else if ((unit >= 200)) {
        // diabetic
        return GlucoseStatus.diabetic;
      } else {
        // unknow
        return GlucoseStatus.unknow;
      }
    }

    return GlucoseStatus.unknow;
  }

  // (Estimated average glucose(mg/dL) + 46.7) / 28.7
  double glucoseToA1C({required int unit}) {
    double result = (unit + 46.7) / 28.7;
    return result;
  }

  // add sample data
  void addSampleData() {
    for (int i = 0; i < 5; i++) {
      // bmi
      db.writeTxn(() async {
        final weight = (70.0 + math.Random().nextInt(5));
        const height = 165.0;
        final bmi = bmiCalculation(weight: weight, height: height);
        final level = bmiLevel(bmi: bmi);

        final data = Bmi()
          ..timestamp = DateTime.now()
          ..weight = weight
          ..height = height
          ..bmi = bmi
          ..status = level;
        await db.bmis.put(data);
      });

      // blood pressure
      db.writeTxn(() async {
        final sys = 80 + math.Random().nextInt(30);
        final dia = 80 + math.Random().nextInt(30);
        final pul = 80 + math.Random().nextInt(10);
        final level = bloodPressureCalculation(systolic: sys, diastolic: dia);

        final data = BloodPressure()
          ..timestamp = DateTime.now()
          ..systolic = sys
          ..diastolic = dia
          ..pulse = pul
          ..status = level;

        await db.bloodPressures.put(data);
      });

      // glucose
      db.writeTxn(() async {
        final unit = 80 + math.Random().nextInt(30);
        final a1c = glucoseToA1C(unit: unit);
        final level = glucoseCalculation(
          measureAt: MeasureAt.fasting,
          unit: unit,
        );

        final data = Glucose()
          ..timestamp = DateTime.now()
          ..measureAt = MeasureAt.fasting
          ..unit = unit
          ..a1c = a1c
          ..status = level;

        await db.glucoses.put(data);
      });
    }
  }
}
