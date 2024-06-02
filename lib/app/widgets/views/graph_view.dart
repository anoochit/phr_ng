import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GraphView extends GetView {
  const GraphView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'GraphView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
