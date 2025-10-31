// lib/app/modules/splash/controllers/onboarding_view_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../Routes/app_pages.dart';
class OnboardingController extends GetxController {
  void navigateToUserAccount() {
    Get.snackbar(
      "Success",
      "Opening User Account",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
    //Get.toNamed(Routes.LOGINSCREEN); // User flow
  }

  void navigateToDriverAccount() {
    Get.snackbar(
      "Success",
      "Opening Driver Account",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );
    //Get.toNamed(Routes.DRIVER_LOGIN); // Driver flow
  }

// Remove this duplicate method
// void DriverButton() { ... }
}