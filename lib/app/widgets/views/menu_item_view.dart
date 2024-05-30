import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

class MenuItemView extends GetView {
  const MenuItemView(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => onTap(),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // icon
              Icon(
                icon,
                size: constraints.maxWidth * 0.4,
              ),

              Gap(8.0),

              // title
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          );
        }),
      ),
    );
  }
}
