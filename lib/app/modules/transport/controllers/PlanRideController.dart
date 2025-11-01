import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../model/RecentPlace.dart';

class PlanRideController extends GetxController {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final RxList<RecentPlace> recentPlaces = <RecentPlace>[].obs;
  final RxList<String> stops = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRecentPlaces();
  }

  void loadRecentPlaces() {
    recentPlaces.value = [
      RecentPlace(
        name: 'Office',
        address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
        distance: '2.7km',
      ),
      RecentPlace(
        name: 'Office',
        address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
        distance: '2.7km',
      ),
      RecentPlace(
        name: 'Office',
        address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
        distance: '2.7km',
      ),
      RecentPlace(
        name: 'Office',
        address: '2972 Westheimer Rd. Santa Ana, Illinois 85486',
        distance: '2.7km',
      ),
    ];
  }

  void addStop() {
    stops.add('');
  }

  void selectRecentPlace(RecentPlace place, bool isFrom) {
    if (isFrom) {
      fromController.text = place.address;
    } else {
      toController.text = place.address;
    }
  }

  void close() {
    Get.back();
  }

  @override
  void onClose() {
    fromController.dispose();
    toController.dispose();
    super.onClose();
  }
}
