// ==================== CONTROLLER ====================
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/ServiceCategory.dart';

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
      ServiceCategory(name: 'Ride', icon: '🚗'),
      ServiceCategory(name: 'Moto', icon: '🏍️'),
      ServiceCategory(name: 'Taxi Rent', icon: '🚕'),
      ServiceCategory(name: 'Intercity', icon: '🚗'),
    ];

    moreWaysToUse.value = [
      PromotionCard(
        title: 'Go For Ride',
        description: 'Ride in a fully electric vehicle',
        imageUrl: 'assets/go_for_ride.png',
      ),
      PromotionCard(
        title: 'Try a Ride Share',
        description: 'Seamless trips, together',
        imageUrl: 'assets/ride_share.png',
      ),
    ];

    saveEveryday.value = [
      PromotionCard(
        title: 'Go on Stop Ride',
        description: 'Take an electric bike or scooter',
        imageUrl: 'assets/stop_ride.png',
      ),
      PromotionCard(
        title: 'Add a Ride Share',
        description: 'Pick up something on the',
        imageUrl: 'assets/add_ride_share.png',
      ),
    ];
  }

  void onSearch(String query) {
    // Search logic
  }

  void onNotificationTap() {
    // Navigate to notifications
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
