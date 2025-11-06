import 'package:get/get.dart';

import '../model/ActivityItem.dart';

class ActivityController extends GetxController {
  // Observable variables
  final RxString selectedFilter = 'All'.obs;
  final RxBool isFilterVisible = false.obs;
  final RxList<ActivityItem> activities = <ActivityItem>[].obs;

  // Filter options
  var filterOptions = [
    'All',
    'Rides',
    'Car',
    'Moto',
    'Car',
    'Bike',


  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadActivities();
  }

  // Load activities (empty for now)
  void loadActivities() {
    // Simulate empty activity list
    activities.value = [];
  }

  // Toggle filter bottom sheet
  void toggleFilter() {
    isFilterVisible.value = !isFilterVisible.value;
  }

  // Select filter
  void selectFilter(String filter) {
    selectedFilter.value = filter;
  }

  // Apply filter
  void applyFilter() {
    isFilterVisible.value = false;
    // Apply filter logic here
    loadActivities();
  }

  // Reset filter
  void resetFilter() {
    selectedFilter.value = 'All';
  }
}
