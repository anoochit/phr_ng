// ignore_for_file: public_member_api_docs, sort_constructors_first
class ChartData {
  DateTime x;
  num y;
  ChartData({
    required this.x,
    required this.y,
  });
}

enum DataSource {
  bmi,
  bloodPressure,
  bloodGlucose,
}
