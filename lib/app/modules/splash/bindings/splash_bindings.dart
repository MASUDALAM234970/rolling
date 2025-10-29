import 'package:get/get.dart';
import 'package:rolling/app/modules/splash/controllers/splash_view_controller.dart';

import '../controllers/onboarding_view_controller.dart';





class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
    Get.put(OnboardingController());
  }
}