import 'package:get/get.dart';
import 'package:rolling/app/modules/home/controllers/BottomNavController.dart';

 class BottomNavBindings extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
