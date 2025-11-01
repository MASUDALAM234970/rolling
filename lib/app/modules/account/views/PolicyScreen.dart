// ==================== VIEW ====================
// screens/policy_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart' hide ScreenType;
import 'package:google_fonts/google_fonts.dart';

import '../controllers/SettingsController.dart';
class PolicyScreen extends GetView<SettingsController> {
  final ScreenType screenType;

  const PolicyScreen({
    Key? key,
    required this.screenType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());
    controller.setScreenType(screenType);

    final isPrivacyPolicy = screenType == ScreenType.privacyPolicy;
    final title = isPrivacyPolicy ? 'Privacy Policy' : 'Delete Acoount';
    final content = isPrivacyPolicy
        ? controller.privacyPolicyContent
        : controller.deleteAccountContent;

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
          title,
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Text(
                content,
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6B7280),
                  height: 1.6,
                ),
              ),
            ),
          ),

          // Show Delete button only for Delete Account screen
          if (!isPrivacyPolicy)
            Container(
              padding: EdgeInsets.all(20.w),
              child: GestureDetector(
                onTap: controller.deleteAccount,
                child: Container(
                  width: double.infinity,
                  height: 52.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Text(
                      'Delete',
                      style: GoogleFonts.inter(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}