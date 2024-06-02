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
    return SizedBox(
      width: (56 * 2) + 8,
      height: (56 * 2),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 56.0,
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
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ),
        ],
      ),
    );
  }
}
