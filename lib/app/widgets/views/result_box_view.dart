import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ResultBoxView extends GetView {
  const ResultBoxView({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        ),
      ),
    );
  }
}
