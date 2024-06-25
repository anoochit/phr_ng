import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:phr/app/data/models/chat_message.dart';
import 'package:phr/app/modules/askai/controllers/askai_controller.dart';

class PromptMenuView extends GetView<AskaiController> {
  const PromptMenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // text
      Text('choose_menu_ask_question'.tr),
      // button
      Column(
        children: List.generate(controller.promptMenuButtons.length, (index) {
          final title = controller.promptMenuButtons[index];
          // button
          return FilledButton.tonal(
            onPressed: () {
              // ask ai
              final question =
                  '${controller.promptMenuButtons[index]}_prompt'.tr;

              controller.askai(
                menu:
                    ChatMessage(message: title.tr, type: ChatMessageType.user),
                question:
                    ChatMessage(message: question, type: ChatMessageType.user),
              );
            },
            child: Text(title.tr),
          );
        }),
      ),
    ]);
  }
}
