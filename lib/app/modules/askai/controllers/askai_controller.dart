import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phr/app/controllers/app_controller.dart';
import 'package:phr/app/data/models/chat_message.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class AskaiController extends GetxController {
  // message
  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  // menu
  List<String> promptMenuButtons = [
    'meal',
    'weight_lost_plan',
  ];

  ScrollController scrollController = ScrollController();

  late WebSocketChannel channel;

  @override
  void onInit() {
    super.onInit();
    // add memnu message
    addMenuToChatMessage();
    // websocket stream listener
    addStreamListener();
  }

  @override
  void onClose() {
    super.onClose();
    channel.sink.close();
  }

  // add menu to chat message
  void addMenuToChatMessage() {
    messages.add(ChatMessage(message: '/menu', type: ChatMessageType.menu));
  }

  // ask ai
  void askai({ChatMessage? menu, required ChatMessage question}) {
    //
    final messageContext = buildMessageContext();

    String prompt = '';

    if (menu != null) {
      messages.add(menu);
    } else {
      messages.add(question);
    }

    prompt = '${question.message} ${'health_info'.trParams({
          "context": messageContext
        })}';

    log(prompt);

    // sent prompt to server
    try {
      channel.sink.add(prompt);
      scrollDown();
    } catch (e) {
      Get.snackbar('error'.tr, '$e');
    }
  }

  // stream listener
  void addStreamListener() {
    try {
      //
      final uri = Uri.parse("ws://10.0.2.2:8080/ws");
      channel = WebSocketChannel.connect(uri);

      // listen stream
      channel.stream.listen((data) {
        String content = '$data';
        if (messages.last.type == ChatMessageType.system) {
          messages.last = ChatMessage(
            message: messages.last.message + content,
            type: ChatMessageType.system,
          );
        } else {
          messages.add(
            ChatMessage(message: content, type: ChatMessageType.system),
          );
        }

        scrollDown();
      });
    } catch (e) {
      //
      Get.snackbar('error'.tr, '$e');
    }
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      curve: Curves.bounceInOut,
      duration: const Duration(seconds: 1),
    );
  }

  String buildMessageContext() {
    AppController appController = Get.find<AppController>();

    final bmiStatus = appController.listBMI.last.status.name;
    final bloodPressureStatus =
        appController.listBloodPressure.last.status.name;
    final bloodGlucoseStatus = appController.listGlucose.last.status.name;

    final message =
        '${bmiStatus.tr}, ${bloodPressureStatus.tr}, ${bloodGlucoseStatus.tr}';

    return message;
  }
}
