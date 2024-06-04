import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileAvatarButtonView extends GetView {
  const ProfileAvatarButtonView({
    super.key,
    this.image,
    required this.backgroundColor,
    required this.title,
    required this.onTap,
  });

  final String title;
  final Uint8List? image;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = image!.buffer.lengthInBytes;
    return SizedBox(
      width: (56 * 2) + 8,
      height: (56 * 2),
      child: Stack(
        children: [
          (size > 0)
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
                ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton.filledTonal(
              onPressed: () => onTap(),
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
