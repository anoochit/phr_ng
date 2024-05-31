import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HistoryButtonView extends GetView {
  const HistoryButtonView({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(onPressed: () => onTap(), child: Text('history'.tr));
  }
}
