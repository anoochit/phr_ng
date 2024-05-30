import 'package:isar/isar.dart';

part 'glucose.g.dart';

@collection
class Glucose {
  Id id = Isar.autoIncrement;
  @Index()
  late DateTime timestamp;

  late int unit;

  @enumerated
  MeasureAt measureAt = MeasureAt.fasting;

  @enumerated
  GlucoseStatus status = GlucoseStatus.normal;
}

enum GlucoseStatus {
  normal,
  impaired,
  diabetic,
  unknow,
}

enum MeasureAt {
  fasting,
  afterEating,
  afterEating23hr,
}
