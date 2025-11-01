import 'package:get/get.dart';


import '../controllers/InboxController.dart';



class InboxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InboxController>(() => InboxController());
  }
}