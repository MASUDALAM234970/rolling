import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = 'John Deo'.obs;
  var userEmail = 'jhon.deo@gmail.com'.obs;
  var profileImage = ''.obs;

  void navigateToSupport() {
    Get.snackbar(
      'Support',
      'Opening support...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToWallet() {
    Get.snackbar(
      'Wallet',
      'Opening wallet...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToInbox() {
    Get.snackbar(
      'Inbox',
      'Opening inbox...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToSettings() {
    Get.snackbar(
      'Settings',
      'Opening settings...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToSetupProfile() {
    Get.snackbar(
      'Setup Profile',
      'Opening setup profile...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToTripHistory() {
    Get.snackbar(
      'Trip History',
      'Opening trip history...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToAboutUs() {
    Get.snackbar(
      'About Us',
      'Opening about us...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToBusinessProfile() {
    Get.snackbar(
      'Business Profile',
      'Opening business profile...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textConfirm: 'Yes',
      textCancel: 'Cancel',
      onConfirm: () {
        Get.back();
        // Handle logout logic here
        Get.snackbar('Success', 'Logged out successfully');
      },
    );
  }

  void editProfile() {
    Get.snackbar(
      'Edit Profile',
      'Opening edit profile...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
