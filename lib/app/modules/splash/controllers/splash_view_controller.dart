import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Routes/app_pages.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Fullscreen (immersive)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Delay before navigation to onboarding screen
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.ONBOARDINGSCREEN);
    });

  }

  @override
  void onClose() {
    // UI restore
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.onClose();
  }
}
