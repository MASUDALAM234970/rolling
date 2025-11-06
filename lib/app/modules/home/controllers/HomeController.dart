// ==================== CONTROLLER ====================
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/ServiceCategory.dart';
import '../views/NotificationView.dart';

class HomeController extends GetxController {
  final RxList<ServiceCategory> suggestions = <ServiceCategory>[].obs;
  final RxList<PromotionCard> moreWaysToUse = <PromotionCard>[].obs;
  final RxList<PromotionCard> saveEveryday = <PromotionCard>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    suggestions.value = [
      ServiceCategory(name: 'Ride', icon: 'assets/home/grid/ride.png'),
      ServiceCategory(name: 'Moto', icon: 'assets/home/grid/moto.png'),
      ServiceCategory(
        name: 'Taxi Rent',
        icon: 'assets/home/grid/taxi_rent.png',
      ),
      ServiceCategory(
        name: 'Intercity',
        icon: 'assets/home/grid/Intercity.png',
      ),
    ];

    moreWaysToUse.value = [
      PromotionCard(
        title: 'Go For Ride',
        description: 'Ride in a fully electric vehicle',
        imageUrl: 'assets/home/grid/home_one_grid_one.png',
      ),
      PromotionCard(
        title: 'Try a Ride Share',
        description: 'Seamless trips, together',
        imageUrl: 'assets/home/grid/home_grid.png',
      ),
    ];

    saveEveryday.value = [
      PromotionCard(
        title: 'Go on Stop Ride',
        description: 'Take an electric bike or scooter',
        imageUrl: 'assets/home/grid/home_grid.png',
      ),
      PromotionCard(
        title: 'Add a Ride Share',
        description: 'Pick up something on the',
        imageUrl: 'assets/home/grid/home_grid_four.png',
      ),
    ];
  }

  void onSearch(String query) {
    // Search logic
  }

  void onNotificationTap() {
    // Navigate to notifications
    Get.to(() => NotificationView());
  }

  void onLaterTap() {
    // Schedule ride for later
  }

  void onSeeAllSuggestions() {
    // Navigate to all suggestions
  }

  void onServiceTap(String service) {
    // Navigate to service
  }

  void onPromotionTap(String title) {
    // Navigate to promotion detail
  }
}
