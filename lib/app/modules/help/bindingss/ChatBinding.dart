// ==================== BINDING ====================
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../controllers/ChatController.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}