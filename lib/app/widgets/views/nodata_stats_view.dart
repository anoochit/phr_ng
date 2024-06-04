import 'package:flutter/material.dart';

import 'package:get/get.dart';

class NodataStatsView extends GetView {
  const NodataStatsView({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16.0),
        child: Text(title),
      ),
    );
  }
}
