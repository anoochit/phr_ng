import 'package:isar/isar.dart';

part 'profile.g.dart';

@collection
class Profile {
  Id id = 1;
  late String name;
  late List<int> image;
  late int age;
  @enumerated
  Gender gender = Gender.male;
}

enum Gender {
  male,
  female,
  other,
}
