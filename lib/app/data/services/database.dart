import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/bmi.dart';
import '../models/glucose.dart';
import '../models/pressure.dart';
import '../models/profile.dart';

class DatabaseService extends GetxController {
  Future<Isar> init() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [
        BmiSchema,
        GlucoseSchema,
        BloodPressureSchema,
        ProfileSchema,
      ],
      directory: dir.path,
    );
  }
}
