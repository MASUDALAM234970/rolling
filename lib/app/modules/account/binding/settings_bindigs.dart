import 'package:get/get.dart';
import 'package:rolling/app/modules/account/controllers/SettingsController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
