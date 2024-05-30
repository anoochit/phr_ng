// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'profile.g.dart';

@collection
class Profile {
  Id id = 1;
  late String name;
  late String image;
  late int age;
  @enumerated
  Gender gener = Gender.male;
  @enumerated
  ThemeMode theme = ThemeMode.dark;
  @enumerated
  LocaleMode locale = LocaleMode.enUS;
}

enum ThemeMode {
  dark,
  light,
  system,
}

enum Gender {
  male,
  female,
  other,
}

enum LocaleMode {
  enUS,
  thTH,
}
