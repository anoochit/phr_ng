import 'package:isar/isar.dart';

part 'setting.g.dart';

@collection
class Setting {
  Id id = 1;
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

enum LocaleMode {
  enUS,
  thTH,
}
