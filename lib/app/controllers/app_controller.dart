import 'dart:developer';

import 'package:get/get.dart';
import 'package:isar/isar.dart';

import '../data/models/bmi.dart';
import '../data/models/glucose.dart';
import '../data/models/pressure.dart';
import '../data/models/profile.dart';
import '../data/services/database.dart';

class AppController extends GetxController {
  RxList<Bmi> listBMI = <Bmi>[].obs;
  RxList<Glucose> listGlucose = <Glucose>[].obs;
  RxList<BloodPressure> listBloodPressure = <BloodPressure>[].obs;
  late Profile profile;

  final DatabaseService _dbService = Get.put(DatabaseService());

  late Isar _db;

  @override
  onInit() async {
    super.onInit();

    // init db
    _db = await _dbService.init();

    // load data
    loadProfileData();
    loadBMIData();
    loadBloodPresureData();
    loadGlucoseData();
  }

  // load bmi data
  loadBMIData() {
    _db.bmis.where().findAll().then((value) {
      log('load bmi data');
      listBMI.value = value;
    });
  }

  // load glucose data
  loadGlucoseData() {
    _db.glucoses.where().findAll().then((value) {
      log('load glucose data');
      listGlucose.value = value;
    });
  }

  // load blood presure data
  loadBloodPresureData() {
    _db.bloodPressures.where().findAll().then((value) {
      log('load blood presure data');
      listBloodPressure.value = value;
    });
  }

  // load profile data
  loadProfileData() {
    _db.profiles.get(1).then((value) async {
      log('load profile data');
      // no profile data, create a template once
      if (value == null) {
        final data = Profile()
          ..name = 'John Doe'
          ..gener = Gender.male
          ..age = 25
          ..image = ''
          ..id = 1
          ..theme = ThemeMode.dark
          ..locale = LocaleMode.enUS;
        // write default value
        await _db.writeTxn(() async {
          await _db.profiles.put(data);
        });
        profile = data;
      } else {
        profile = value;
      }
      update();
    });
  }
}
