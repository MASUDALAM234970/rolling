import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/PolicyScreen.dart';
import '../views/change_password_views.dart';
enum ScreenType { privacyPolicy, deleteAccount }
class SettingsController extends GetxController {
  var screenType = ScreenType.privacyPolicy.obs;

  // Privacy Policy Content
  String get privacyPolicyContent => '''Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.''';

  // Delete Account Content
  String get deleteAccountContent => '''Are you sure you want to delete your account? Please read how account deletion will affect.
Deleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.''';


  void navigateToChangePassword() {

     Get.to(() =>  ChangePasswordViews());
  }



  void navigateToPrivacyPolicy() {
    // Get.snackbar(
    //   'Privacy Policy',
    //   'Opening privacy policy...',
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: Colors.grey.withOpacity(0.8),
    //   colorText: Colors.white,
    // );
    // Navigate to the PolicyScreen and pass the correct ScreenType
    Get.to(() => PolicyScreen(screenType: ScreenType.privacyPolicy));
  }

  void navigateToDeleteAccount() {
    Get.snackbar(
      'Delete Account',
      'Opening delete account screen...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to the PolicyScreen and pass the correct ScreenType
    Get.to(() => PolicyScreen(screenType: ScreenType.deleteAccount));
  }






  void setScreenType(ScreenType type) {
    screenType.value = type;
  }



  void performDelete() {
    // Handle actual delete logic here
    Get.snackbar(
      'Account Deleted',
      'Your account has been permanently deleted',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.8),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
    );

    // Navigate to login or welcome screen
    // Get.offAll(() => const LoginScreen());
  }
}