import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphBoxView extends GetView {
  const GraphBoxView({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO : show graph according to data
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
          series: [],
        ),
      ),
    );
  }
}
