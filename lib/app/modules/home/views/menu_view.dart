import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/views/menu_item_view.dart';
import '../controllers/home_controller.dart';

class MenuView extends GetView<HomeController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = controller.menuItems;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        menus.length,
        (index) {
          final title = menus[index].title;
          final icon = menus[index].icon;
          final route = menus[index].route;
          return MenuItemView(
            title: title,
            icon: icon,
            onTap: () => Get.toNamed(route),
          );
        },
      ),
    );
  }
}
