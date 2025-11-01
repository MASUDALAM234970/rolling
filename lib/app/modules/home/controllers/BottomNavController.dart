import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;

    // Navigate to different screens based on index
    switch (index) {
      case 0:
      // Navigate to Home
        Get.snackbar('Navigation', 'Home');
        break;
      case 1:
      // Navigate to Services
        Get.snackbar('Navigation', 'Services');
        break;
      case 2:
      // Navigate to Activity
        Get.snackbar('Navigation', 'Activity');
        break;
      case 3:
      // Navigate to Account
        Get.snackbar('Navigation', 'Account');
        break;
    }
  }
}
