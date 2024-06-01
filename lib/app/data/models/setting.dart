import 'package:isar/isar.dart';

part 'setting.g.dart';

@collection
class Setting {
  Id id = 1;
  @enumerated
  ThemeStatus theme = ThemeStatus.dark;
  @enumerated
  LocaleStatus locale = LocaleStatus.enUS;
}

enum ThemeStatus {
  dark,
  light,
  system,
}

enum LocaleStatus {
  enUS,
  thTH,
}
