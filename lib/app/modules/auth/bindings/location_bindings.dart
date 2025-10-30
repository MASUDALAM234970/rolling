import 'package:get/get.dart';

import '../controllers/Location_Controller.dart';

class LocationBindings extends Bindings {
  @override
  void dependencies() {
    // Inject LocationController when this binding is used

    Get.put(() => (LocationController()));
  }
}
