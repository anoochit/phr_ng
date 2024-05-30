import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MenuButtonView extends GetView {
  const MenuButtonView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MenuButtonView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MenuButtonView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
