import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/askai_controller.dart';

class AskaiView extends GetView<AskaiController> {
  const AskaiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AskaiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AskaiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
