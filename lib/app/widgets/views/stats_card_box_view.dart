import 'package:flutter/material.dart';

import 'package:get/get.dart';

class StatsCardBoxView extends GetView {
  const StatsCardBoxView({
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
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // title
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),

          // value
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              value,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),

          // unit
          Text(
            unit,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
