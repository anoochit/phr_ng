import 'dart:io';

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
  final String? image;
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
            child: (image == '')
                ? const Icon(
                    Icons.person,
                    size: 56.0,
                  )
                : Image.file(
                    File(image!),
                    fit: BoxFit.cover,
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