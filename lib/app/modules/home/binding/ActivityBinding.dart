import 'package:get/get.dart';
import '../controllers/ActivityControlle.dart';

class ActivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityController>(() => ActivityController());
  }
}
