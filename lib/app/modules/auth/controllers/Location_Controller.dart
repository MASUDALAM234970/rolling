// lib/controllers/location_controller.dart
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rolling/app/Routes/app_pages.dart';

class LocationController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> requestLocationPermission() async {
    isLoading(true);

    // 1. Check if location service is enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      isLoading(false);
      return;
    }

    // 2. Check permission
    var status = await Permission.locationWhenInUse.status;

    if (status.isDenied) {
      status = await Permission.locationWhenInUse.request();
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      isLoading(false);
      return;
    }

    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        print("Location: ${position.latitude}, ${position.longitude}");

        // Navigate to next screen
        Get.toNamed(Routes.LOGINSCREEN);
      } catch (e) {
        Get.snackbar("Error", "Failed to get location");
      }
    }

    isLoading(false);
  }
}