import 'dart:developer';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/bmi.dart';
import '../data/models/glucose.dart';
import '../data/models/pressure.dart';
import '../data/models/profile.dart';
import '../data/models/setting.dart';
import 'app_controller.dart';

initDatabase() async {
  log('init database');
  // find database dir
  final dir = await getApplicationDocumentsDirectory();
  // find app controller
  final appController = Get.find<AppController>();
  // init database
  final db = await Isar.open(
    [
      BmiSchema,
      GlucoseSchema,
      BloodPressureSchema,
      ProfileSchema,
      SettingSchema,
    ],
    name: 'default',
    directory: dir.path,
  );
  // inject database instance
  appController.db = db;
}
