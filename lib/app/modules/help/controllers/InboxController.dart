import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/message.dart';

import 'package:get/get.dart';

class InboxController extends GetxController {
  final RxList<Message> messages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    messages.value = [
      Message(
        name: 'Alex Molar',
        message: 'Hi, How are You?',
        avatarUrl: 'assets/avatar.png',
      ),
      Message(
        name: 'Alex Molar',
        message: 'Hi, How are You?',
        avatarUrl: 'assets/avatar.png',
      ),
      Message(
        name: 'Alex Molar',
        message: 'Hi, How are You?',
        avatarUrl: 'assets/avatar.png',
      ),
      Message(
        name: 'Alex Molar',
        message: 'Hi, How are You?',
        avatarUrl: 'assets/avatar.png',
      ),
      Message(
        name: 'Alex Molar',
        message: 'Hi, How are You?',
        avatarUrl: 'assets/avatar.png',
      ),
    ];
  }

  void openMessage(int index) {
    // Navigate to message detail screen
  }
}
