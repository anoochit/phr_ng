import 'package:isar/isar.dart';

part 'bmi.g.dart';

@collection
class Bmi {
  Id id = Isar.autoIncrement;
  @Index()
  late DateTime timestamp;
  late double weight;
  late double height;
  late double bmi;
  @enumerated
  BmiStatus status = BmiStatus.normalWeight;
}

enum BmiStatus {
  underWeight,
  normalWeight,
  overWeight,
  obesity,
}
