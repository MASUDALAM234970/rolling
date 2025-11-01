import 'package:get/get.dart';
import 'package:rolling/app/modules/home/controllers/BottomNavController.dart';

abstract class BottomNavBindings extends Bindings {
  BottomNavBindings._();

  @override
  void dependencies() {
    Get.lazyPut<BottomNavController>(() => BottomNavController());
  }
}
