// lib/views/location_permission_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import '../controllers/location_controller.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject controller (only once)
    final controller = Get.put(LocationController());

    return Scaffold(
      body: Stack(
        children: [
          // Background map
          Image.asset(
            'assets/auth/map.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          // Blur + tint
          Positioned.fill(
            child: BackdropFilter(
              filter:  ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
              child: Container(color: const Color(0x80414141)),
            ),
          ),

          // Icon circle
          Positioned(
            left: 136,
            right: 140,
            top: 235,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: const Color(0x265d667e),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0x593d4865),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xff0D1A3E),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/auth/LocationMarker.png",width: 24,height: 24,),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Title
          Positioned(
            left: 60,
            right: 65,
            top: 377,
            child: const Text(
              "Enable your location",
              style: TextStyle(
                color: Color(0xff0D1A3E),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Subtitle
          Positioned(
            left: 56,
            right: 57,
            top: 416,
            child: const Text(
              "Choose your location to start find the request around you",
              style: TextStyle(
                color: Color(0xffBCBCBC),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Button with loading state
          Positioned(
            top: 500,
            left: 41,
            right: 46,
            child: Obx(() => SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.requestLocationPermission,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D1A3E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
                    : const Text(
                  "Use my location",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}