import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StatsBoxView extends GetView {
  const StatsBoxView({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
  });

  final String title;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),

        // value
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        // unit
        Text(
          unit,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
