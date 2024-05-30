import 'package:isar/isar.dart';

part 'pressure.g.dart';

@collection
class BloodPressure {
  Id id = Isar.autoIncrement;
  @Index()
  late DateTime dateTime;
  late int systolic;
  late int diastolic;
  late int pulse;
  @enumerated
  BloodPresureStatus status = BloodPresureStatus.normal;
}

enum BloodPresureStatus {
  hypo,
  normal,
  preHyper,
  hyperState1,
  hyperState2,
}
