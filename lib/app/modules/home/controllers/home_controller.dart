import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../data/models/menu_item.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  List<MenuItem> menuItems = [
    MenuItem(
      icon: FontAwesomeIcons.weightScale,
      title: 'body_mass_index',
      route: Routes.BMI,
    ),
    MenuItem(
      icon: FontAwesomeIcons.heartPulse,
      title: 'blood_pressure',
      route: Routes.BLOOD_PRESSURE,
    ),
    MenuItem(
      icon: FontAwesomeIcons.candyCane,
      title: 'blood_glucose',
      route: Routes.BLOOD_GLUCOSE,
    ),
  ];
}
