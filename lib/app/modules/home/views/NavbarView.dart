// views/BottomnavbarView.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/BottomNavController.dart';

class BottomnavbarView extends GetView<BottomNavController> {
  const BottomnavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    // DO NOT use Get.put() here — GetView already provides controller
    // Remove: Get.put(BottomNavController())

    return Scaffold(
      backgroundColor: Colors.white,

      // Selected Screen
      body: Obx(() => controller.screens[controller.index.value]),

      // Bottom Nav
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Obx(() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            "assets/home/nab/home.png",
            'Home',
            0,
          ),
          _buildNavItem(
            "assets/home/nab/services.png",
            'Services',
            1,
          ),
          _buildNavItem(
            "assets/home/nab/activity.png",
            'Activity',
            2,
          ),
          _buildNavItem(
            "assets/home/nab/account.png",
            'Account',
            3,
          ),
        ],
      )),
    );
  }

  Widget _buildNavItem(String assetPath, String label, int index) {
    final isSelected = controller.index.value == index;

    return InkWell(
      onTap: () => controller.changeIndex(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ColorFiltered works only on GRAYSCALE images
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              isSelected ? Colors.black : const Color(0xFF87878A),
              BlendMode.srcIn,
            ),
            child: Image.asset(
              assetPath,
              width: 26.w,
              height: 26.h,

            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? Colors.black : const Color(0xFF87878A),
            ),
          ),
        ],
      ),
    );
  }
}