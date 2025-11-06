import 'package:get/get.dart';
import 'package:rolling/app/modules/home/controllers/BottomNavController.dart';

import '../controllers/ActivityControlle.dart';
import '../controllers/HomeController.dart';

 class BottomNavBindings extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
    Get.lazyPut<ActivityController>(() => ActivityController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
