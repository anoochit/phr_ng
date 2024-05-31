import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/share_controller.dart';

class ShareView extends GetView<ShareController> {
  const ShareView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('share'.tr),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ShareView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
