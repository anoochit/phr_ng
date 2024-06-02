import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/controllers/app_controller.dart';

import '../../../widgets/views/menu_item_view.dart';

class MenuView extends GetView<AppController> {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final menus = controller.menuItems;
    final datas = [
      controller.listBMI,
      controller.listBloodPressure,
      controller.listGlucose,
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: menus.length,
      itemBuilder: (BuildContext context, int index) {
        final title = menus[index].title;
        final icon = menus[index].icon;
        final route = menus[index].route;
        return MenuItemView(
          title: title.tr,
          icon: icon,
          onTap: () => (datas[index].isNotEmpty) ? Get.toNamed(route) : null,
        );
      },
    );
  }
}
