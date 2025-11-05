import 'package:get/get.dart';




import '../../account/views/ProfileScreen.dart';
import '../../account/views/SettingsScreen.dart';
import '../views/HomeView.dart';
import '../views/Servicesviews.dart';

class BottomNavController extends GetxController {
  // Reactive index tracking
  var index = 0.obs;

  // Screens to navigate between (HomeScreenView as first screen)
  final screens = [
    HomeView(),
    Servicesviews(),
    SettingsScreen(),
    ProfileScreen()


   // ProductScreenViews(),
    //CustomerSupportView(),
   // ProfileScreenViews(),
  ];

  void changeIndex(int i) {
    index.value = i;
  }
}

// controllers/BottomNavController.dart
