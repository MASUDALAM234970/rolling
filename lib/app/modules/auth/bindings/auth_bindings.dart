import 'package:get/get.dart';


import '../controllers/LoginController.dart';

class AuthBinding extends Bindings {
  void dependencies() {
    // Register your authentication dependencies here

    Get.put<LoginController>(LoginController());
  }
}