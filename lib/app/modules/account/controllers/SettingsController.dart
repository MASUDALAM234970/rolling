import 'package:flutter/material.dart';
import 'package:get/get.dart';
enum ScreenType { privacyPolicy, deleteAccount }
class SettingsController extends GetxController {
  var screenType = ScreenType.privacyPolicy.obs;

  // Privacy Policy Content
  String get privacyPolicyContent => '''Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We're dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We're working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.''';

  // Delete Account Content
  String get deleteAccountContent => '''Are you sure you want to delete your account? Please read how account deletion will affect.
Deleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.''';


  void navigateToChangePassword() {
    Get.snackbar(
      'Change Password',
      'Opening change password screen...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to change password screen
    // Get.to(() => const ChangePasswordScreen());
  }

  void navigateToPrivacyPolicy() {
    Get.snackbar(
      'Privacy Policy',
      'Opening privacy policy...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.grey.withOpacity(0.8),
      colorText: Colors.white,
    );
    // Navigate to privacy policy screen
    // Get.to(() => const PrivacyPolicyScreen());
  }

  void showDeleteAccountDialog() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Delete Account',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
          style: TextStyle(fontSize: 15),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              deleteAccount();
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // void deleteAccount() {
  //   // Handle delete account logic here
  //   Get.snackbar(
  //     'Account Deleted',
  //     'Your account has been deleted',
  //     snackPosition: SnackPosition.BOTTOM,
  //     backgroundColor: Colors.red.withOpacity(0.8),
  //     colorText: Colors.white,
  //     duration: const Duration(seconds: 2),
  //   );
  //
  //   // Navigate to login/welcome screen
  //   // Get.offAll(() => const LoginScreen());
  // }

  // PolicyScreenController




  void setScreenType(ScreenType type) {
    screenType.value = type;
  }

  void deleteAccount() {
    Get.defaultDialog(
      title: 'Confirm Deletion',
      middleText: 'Are you absolutely sure you want to delete your account? This action cannot be undone.',
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      cancelTextColor: Colors.grey,
      onConfirm: () {
        Get.back(); // Close dialog
        performDelete();
      },
    );
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