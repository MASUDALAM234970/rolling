// ==================== CONTROLLER ====================
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../views/ChatView.dart';
import 'package:flutter/material.dart';

class ChatController extends GetxController {
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;
  final TextEditingController messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    messages.value = [
      ChatMessage(
        message: 'Good Evening!',
        time: '8:29 pm',
        isSender: false,
      ),
      ChatMessage(
        message: 'Welcome to Car2go Customer Service',
        time: '8:29 pm',
        isSender: false,
      ),
      ChatMessage(
        message: 'Welcome to Car2go Customer Service',
        time: '8:29 pm',
        isSender: true,
      ),
      ChatMessage(
        message: 'Welcome to Car2go Customer Service',
        time: '8:29 pm',
        isSender: false,
      ),
      ChatMessage(
        message: 'Welcome to Car2go Customer Service',
        time: 'Just now',
        isSender: true,
      ),
    ];
  }

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      messages.add(
        ChatMessage(
          message: messageController.text,
          time: 'Just now',
          isSender: true,
        ),
      );
      messageController.clear();
    }
  }

  void openAttachment() {
    // Open attachment picker
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}