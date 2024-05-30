import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GraphBoxView extends GetView {
  const GraphBoxView({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'GraphBoxView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
