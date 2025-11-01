import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/ProfileController.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

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
                  fontSize: 16.sp,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          onPressed: () => Get.back(),
        ),
        leadingWidth: 90.w,
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: controller.editProfile,
            child: Text(
              'Edit',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF00D9A5),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            // Profile Image and Info
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400&h=400&fit=crop',
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Obx(() => Text(
                    controller.userName.value,
                    style: GoogleFonts.inter(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )),
                  SizedBox(height: 6.h),
                  Obx(() => Text(
                    controller.userEmail.value,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF7D7F88),
                    ),
                  )),
                ],
              ),
            ),

            SizedBox(height: 32.h),

            // Three Action Cards
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.headset_mic_outlined,
                      label: 'Support',
                      onTap: controller.navigateToSupport,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.account_balance_wallet_outlined,
                      label: 'Wallet',
                      onTap: controller.navigateToWallet,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildActionCard(
                      icon: Icons.mail_outline,
                      label: 'Inbox',
                      onTap: controller.navigateToInbox,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // Menu Items
            _buildMenuItem(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: controller.navigateToSettings,
            ),
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Setup Profile',
              onTap: controller.navigateToSetupProfile,
            ),
            _buildMenuItem(
              icon: Icons.history,
              title: 'Trip History',
              onTap: controller.navigateToTripHistory,
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'About Us',
              onTap: controller.navigateToAboutUs,
            ),
            _buildMenuItem(
              icon: Icons.business_outlined,
              title: 'Business Profile',
              onTap: controller.navigateToBusinessProfile,
            ),
            _buildMenuItem(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: controller.logout,
              isLogout: true,
            ),

            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32.sp, color: Colors.black),
            SizedBox(height: 8.h),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 22.sp,
                color: isLogout ? Colors.red : const Color(0xFF7D7F88),
              ),
            ),
            SizedBox(width: 16.w),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: isLogout ? Colors.red : const Color(0xFF1D1E20),
              ),
            ),
            const Spacer(),
            if (!isLogout)
              Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: const Color(0xFF7D7F88),
              ),
          ],
        ),
      ),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home_outlined, 'Home', false),
          _buildNavItem(Icons.grid_view_outlined, 'Services', false),
          _buildNavItem(Icons.description_outlined, 'Activity', false),
          _buildNavItem(Icons.person, 'Account', true),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 26.sp,
          color: isSelected ? Colors.black : const Color(0xFF7D7F88),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.black : const Color(0xFF7D7F88),
          ),
        ),
      ],
    );
  }
}