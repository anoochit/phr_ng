import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:phr/app/controllers/app_controller.dart';
import 'package:phr/app/data/models/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphBoxView extends GetView<AppController> {
  const GraphBoxView({super.key, required this.title, required this.data});

  final String title;
  final DataSource data;

  @override
  Widget build(BuildContext context) {
    // TODO : show graph according to data
    List<List<ChartData>> chartData = [];
    List<ChartData> chartData1 = [];
    List<ChartData> chartData2 = [];
    List<ChartData> chartData3 = [];

    if (data == DataSource.bmi) {
      for (var item in controller.listBMI) {
        chartData1.add(ChartData(
          x: item.timestamp,
          y: item.weight,
        ));

        chartData2.add(ChartData(
          x: item.timestamp,
          y: item.height,
        ));

        chartData3.add(ChartData(
          x: item.timestamp,
          y: item.bmi,
        ));
      }

      chartData = [
        chartData1,
        chartData2,
        chartData3,
      ];
    }

    if (data == DataSource.bloodPressure) {
      for (var item in controller.listBloodPressure) {
        chartData1.add(ChartData(
          x: item.timestamp,
          y: item.systolic,
        ));

        chartData2.add(ChartData(
          x: item.timestamp,
          y: item.diastolic,
        ));

        chartData3.add(ChartData(
          x: item.timestamp,
          y: item.pulse,
        ));
      }

      chartData = [
        chartData1,
        chartData2,
        chartData3,
      ];
    }

    if (data == DataSource.bloodGlucose) {
      for (var item in controller.listGlucose) {
        chartData1.add(ChartData(
          x: item.timestamp,
          y: item.unit,
        ));

        chartData2.add(ChartData(
          x: item.timestamp,
          y: item.a1c,
        ));
      }

      chartData = [
        chartData1,
        chartData2,
        chartData3,
      ];
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(
            axisLabelFormatter: (axisLabelRenderArgs) => ChartAxisLabel(
                DateFormat.Md()
                    .format(DateTime.parse(axisLabelRenderArgs.text)),
                null),
          ),
          primaryYAxis: NumericAxis(),
          series: List.generate(chartData.length, (index) {
            final data = chartData[index].toList();
            return LineSeries<ChartData, dynamic>(
              dataSource: data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            );
          }),
        ),
      ),
    );
  }
}
