import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/bmi.dart';
import '../data/models/glucose.dart';
import '../data/models/pressure.dart';
import '../data/models/profile.dart';
import '../data/models/setting.dart';

Future<Isar> initDatabase() async {
  log('init database');
  final dir = await getApplicationDocumentsDirectory();

  return await Isar.open(
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
}
