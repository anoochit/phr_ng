import 'dart:developer';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
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

  late Isar _db;

  @override
  onInit() async {
    super.onInit();

    log('app init');

    // init db
    _db = await initializedDatabase();

    // load data
    loadProfileData();
    loadBMIData();
    loadBloodPresureData();
    loadGlucoseData();
  }

  Future<Isar> initializedDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        BmiSchema,
        GlucoseSchema,
        BloodPressureSchema,
        ProfileSchema,
        SettingSchema,
      ],
      directory: dir.path,
    );
  }

  // load bmi data
  loadBMIData() {
    _db.bmis.where().findAll().then((value) {
      log('load bmi data');
      listBMI.value = value;
      update();
    });
  }

  // load glucose data
  loadGlucoseData() {
    _db.glucoses.where().findAll().then((value) {
      log('load glucose data');
      listGlucose.value = value;
      update();
    });
  }

  // load blood presure data
  loadBloodPresureData() {
    _db.bloodPressures.where().findAll().then((value) {
      log('load blood presure data');
      listBloodPressure.value = value;
      update();
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
          ..gender = Gender.male
          ..age = 25
          ..image = ''
          ..id = 1;
        // write default value
        await _db.writeTxn(() async {
          await _db.profiles.put(data);
        });
        profile = data;
      } else {
        profile = value;
      }
    });

    _db.settings.get(1).then((value) async {
      log('load profile data');
      // no profile data, create a template once
      if (value == null) {
        final data = Setting()
          ..theme = ThemeMode.dark
          ..locale = LocaleMode.enUS;
        // write default value
        await _db.writeTxn(() async {
          await _db.settings.put(data);
        });
        setting = data;
      } else {
        setting = value;
      }
    });

    update();
  }

  String getThemeTitle(ThemeMode theme) {
    switch (theme.name) {
      case 'dark':
        return 'dark';

      case 'light':
        return 'light';

      case 'system':
        return 'system';

      default:
        return 'dark';
    }
  }

  getLocaleTitle(LocaleMode locale) {
    switch (locale.name) {
      case 'enUS':
        return 'english';

      case 'thTH':
        return 'thai';

      default:
        return 'english';
    }
  }

  getGenderTitle(Gender gender) {
    switch (gender.name) {
      case 'male':
        return 'male';

      case 'female':
        return 'female';

      default:
        return 'other';
    }
  }
}
