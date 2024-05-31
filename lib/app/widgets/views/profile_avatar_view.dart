import 'dart:io';

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
  final String? image;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 48.0,
      child: (image == '')
          ? const Icon(
              Icons.person,
              size: 48.0,
            )
          : Image.file(
              File(image!),
              fit: BoxFit.cover,
            ),
      backgroundColor: backgroundColor,
    );
  }
}
