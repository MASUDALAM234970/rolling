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
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff0D1A3E),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: controller.editProfile,
            child: Text(
              'Edit',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF10B981),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.h),

            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    // Correctly use AssetImage with backgroundImage
                    backgroundImage: AssetImage(
                      "assets/account/profile/profile.png",
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => Text(
                      controller.userName.value,
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Obx(
                    () => Text(
                      controller.userEmail.value,
                      style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF87878A),
                      ),
                    ),
                  ),
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
                      icon: Image.asset(
                        "assets/account/profile/headset-help.png",
                      ),

                      label: 'Support',
                      onTap: controller.navigateToSupport,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildActionCard(
                      icon: Image.asset(
                        "assets/account/profile/settings_wallet.png",
                      ),
                      label: 'Wallet',
                      onTap: controller.navigateToWallet,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: _buildActionCard(
                      icon: Image.asset("assets/account/profile/inbox.png"),
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

              icon: Image.asset("assets/account/profile/setting.png"),
              title: 'Settings',
              onTap: controller.navigateToSettings,
            ),
            _buildMenuItem(
              icon: Image.asset("assets/account/profile/settings_user.png"),
              title: 'Setup Profile',
              onTap: controller.navigateToSetupProfile,
            ),
            _buildMenuItem(
              icon: Image.asset("assets/account/profile/settings_watch.png"),
              title: 'Trip History',
              onTap: controller.navigateToTripHistory,
            ),
            _buildMenuItem(
              icon: Image.asset("assets/account/profile/settings_question.png"),
              title: 'About Us',
              onTap: controller.navigateToAboutUs,
            ),
            _buildMenuItem(
              icon: Image.asset("assets/account/profile/settings_business.png"),
              title: 'Business Profile',
              onTap: controller.navigateToBusinessProfile,
            ),
            _buildMenuItem(
              icon: Image.asset("assets/account/profile/settings_log_out.png"),
              title: 'Log Out',
              onTap: controller.logout,
              isLogout: true,
            ),

            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard({
    required Widget icon, // Change from IconData to Widget (Image)
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110.w,
        height: 100.h,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: const Color(0xffF5F6FA),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            SizedBox(width: 24, height: 24, child: icon),
            // Display the image directly here
            SizedBox(height: 8.h),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff1E1E1E),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required Widget icon, // Change from IconData to Widget (Image)
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          children: [
            SizedBox(width: 25, height: 25, child: icon),

            SizedBox(width: 16.w),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color:  Color(0xFF676769),
              ),
            ),
            // const Spacer(),
            // if (!isLogout)
            //   Icon(
            //     Icons.arrow_forward_ios,
            //     size: 16.sp,
            //     color: const Color(0xFF7D7F88),
            //   ),
          ],
        ),
      ),
    );
  }
}
