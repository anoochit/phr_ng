import 'package:get/get.dart';

import '../modules/add_blood_glucose/bindings/add_blood_glucose_binding.dart';
import '../modules/add_blood_glucose/views/add_blood_glucose_view.dart';
import '../modules/add_blood_pressure/bindings/add_blood_pressure_binding.dart';
import '../modules/add_blood_pressure/views/add_blood_pressure_view.dart';
import '../modules/add_bmi/bindings/add_bmi_binding.dart';
import '../modules/add_bmi/views/add_bmi_view.dart';
import '../modules/blood_glucose/bindings/blood_glucose_binding.dart';
import '../modules/blood_glucose/views/blood_glucose_view.dart';
import '../modules/blood_pressure/bindings/blood_pressure_binding.dart';
import '../modules/blood_pressure/views/blood_pressure_view.dart';
import '../modules/bmi/bindings/bmi_binding.dart';
import '../modules/bmi/views/bmi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/share/bindings/share_binding.dart';
import '../modules/share/views/share_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.BMI,
      page: () => const BmiView(),
      binding: BmiBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.BLOOD_PRESSURE,
      page: () => const BloodPressureView(),
      binding: BloodPressureBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.BLOOD_GLUCOSE,
      page: () => const BloodGlucoseView(),
      binding: BloodGlucoseBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.ADD_BMI,
      page: () => const AddBmiView(),
      binding: AddBmiBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.ADD_BLOOD_PRESSURE,
      page: () => const AddBloodPressureView(),
      binding: AddBloodPressureBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.ADD_BLOOD_GLUCOSE,
      page: () => const AddBloodGlucoseView(),
      binding: AddBloodGlucoseBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: _Paths.SHARE,
      page: () => const ShareView(),
      binding: ShareBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
