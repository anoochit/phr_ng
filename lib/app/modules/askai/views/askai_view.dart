import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'package:get/get.dart';
import 'package:phr/app/data/models/chat_message.dart';

import '../controllers/askai_controller.dart';
import 'prompt_menu_view.dart';

class AskaiView extends GetView<AskaiController> {
  const AskaiView({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ask_ai'.tr),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // list message
            Expanded(
              child: Obx(
                () => ListView.builder(
                  controller: controller.scrollController,
                  itemCount: controller.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = controller.messages[index];
                    final type = item.type;
                    final content = item.message;
                    // show message
                    switch (type) {
                      case ChatMessageType.menu:
                        // menu
                        return PromptMenuView();

                      case ChatMessageType.system:
                        // system message
                        return ListTile(
                          titleAlignment: ListTileTitleAlignment.top,
                          leading: Icon(Icons.smart_toy_outlined),
                          title: MarkdownBody(data: content),
                        );

                      default:
                        // user message
                        return ListTile(
                          leading: Icon(Icons.account_circle_outlined),
                          titleAlignment: ListTileTitleAlignment.top,
                          title: Text(content),
                        );
                    }
                  },
                ),
              ),
            ),

            // inputbox
            Flexible(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    prefixIcon: Icon(Icons.keyboard_alt_outlined),
                    hintText: 'type_your_message_here'.tr,
                  ),
                  onFieldSubmitted: (value) {
                    // ask ai
                    controller.askai(
                        question: ChatMessage(
                            message: value, type: ChatMessageType.user));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
