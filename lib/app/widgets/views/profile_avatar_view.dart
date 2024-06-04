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
    final size = image!.buffer.lengthInBytes;
    return (size > 0)
        ? CircleAvatar(
            radius: 56.0,
            backgroundColor: backgroundColor,
            foregroundImage: MemoryImage(image!),
          )
        : CircleAvatar(
            radius: 56.0,
            backgroundColor: backgroundColor,
            child: const Icon(
              Icons.person,
              size: 48.0,
            ),
          );
  }
}
