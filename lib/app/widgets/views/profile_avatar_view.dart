import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileAvatarView extends GetView {
  const ProfileAvatarView({
    super.key,
    this.image,
    required this.backgroundColor,
    required this.title,
  });

  final String title;
  final Uint8List? image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 48.0,
      backgroundColor: backgroundColor,
      child: Image.memory(
        image!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.person,
            size: 48.0,
          );
        },
      ),
    );
  }
}
