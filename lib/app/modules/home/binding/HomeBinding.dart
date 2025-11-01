import 'package:get/get.dart';

import '../controllers/HomeController.dart';




class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}