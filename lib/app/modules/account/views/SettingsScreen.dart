import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/SettingsController.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Row(
            children: [
              const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
              Text(
                'Back',
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  color: Color(0xff676769),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          onPressed: () => Get.back(),
        ),
        leadingWidth: 90.w,
        title: Text(
          'Settings',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff0D1A3E),
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            // Change Password
            _buildSettingItem(
              icon: Image.asset("assets/account/setting/se_lock.png"),
              iconColor: const Color(0xFF6B7280),
              title: 'Changes Password',
              onTap: controller.navigateToChangePassword,
            ),

            SizedBox(height: 16.h),

            // Privacy Policy
            _buildSettingItem(
              icon: Image.asset("assets/account/setting/check_in.png"),
              iconColor: const Color(0xFF6B7280),
              title: 'Privacy Policy',
              onTap: controller.navigateToPrivacyPolicy,
            ),

            SizedBox(height: 16.h),

            // Delete Account
            _buildSettingItem(
              icon: Image.asset("assets/account/setting/se_delete.png"),
              iconColor: Colors.red,
              title: 'Delete Account',
              titleColor: const Color(0xFF6B7280),
              onTap: controller.navigateToDeleteAccount,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required Widget icon,
    required Color iconColor,
    required String title,
    Color? titleColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6FA),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 22.w, height: 24.h, child: icon),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: titleColor ?? const Color(0xFF676769),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
