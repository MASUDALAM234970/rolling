import 'dart:ui';

import '../controllers/EditProfileController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditProfileController controller = Get.put(EditProfileController());

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
            onPressed: (){},
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),

              // Profile Image with Edit Icon
              Center(
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        radius: 42.r,
                        backgroundColor: Colors.grey[300],
                        backgroundImage:
                            controller.profileImage.value.isNotEmpty
                            ? FileImage(File(controller.profileImage.value))
                            : const AssetImage(
                                    'assets/account/profile/profile.png',
                                  )
                                  as ImageProvider,
                      ),
                    ),

                    // Circular BackdropFilter
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                            // Adjust blur
                            child: Container(
                              width: 84.r,
                              // Diameter = 2 * radius of CircleAvatar
                              height: 84.r,
                              color: const Color(0x66000000),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 20,
                      top: 35,
                      right: 25,
                      child: GestureDetector(
                        onTap: controller.pickImage,
                        child: SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: Image.asset(
                            "assets/account/profile/PencilAlt.png",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),

              // Your Name Field
              Text(
                'Your Name',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0D1A3E),
                ),
              ),
              SizedBox(height: 12.h),
              TextField(
                controller: controller.nameController,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: const Color(0xFF7D7F88),
                ),
                decoration: InputDecoration(
                  fillColor: Color(0xffF5F6FA),
                  hintText: 'Enter your name',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: const Color(0xFFB0B3B8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Color(0xff676769)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Color(0xff676769)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),

                    borderSide: const BorderSide(
                      color: Color(0xff676769),
                      width: 1,
                    ),
                  ),
                  //fillColor: Color(0xff676769),
                ),
              ),

              SizedBox(height: 24.h),

              // Phone Number Field
              Text(
                'Phone Number',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0D1A3E),
                ),
              ),
              SizedBox(height: 12.h),
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: const Color(0xFF7D7F88),
                ),

                decoration: InputDecoration(
                  fillColor: Color(0xffF5F6FA),
                  hintText: 'Enter phone number',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: const Color(0xFFB0B3B8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Color(0xff676769)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Color(0xff676769)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),

                    borderSide: const BorderSide(
                      color: Color(0xff676769),
                      width: 1,
                    ),
                  ),
                  //fillColor: Color(0xff676769),
                ),
              ),

              SizedBox(height: 24.h),

              // Your ID Number Field
              Text(
                'Your ID Number',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff0D1A3E),
                ),
              ),
              SizedBox(height: 12.h),
              TextField(
                controller: controller.idNumberController,
                keyboardType: TextInputType.number,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  color: const Color(0xFF7D7F88),
                ),

                decoration: InputDecoration(
                  fillColor: Color(0xffF5F6FA),
                  hintText: 'Enter ID number',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: const Color(0xFFB0B3B8),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Color(0xff676769)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Color(0xff676769)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),

                    borderSide: const BorderSide(
                      color: Color(0xff676769),
                      width: 1,
                    ),
                  ),
                  //fillColor: Color(0xff676769),
                ),
              ),

              SizedBox(height: 40.h),

              // Update Button
              SizedBox(
                width: 361.w,
                height: 57.h,
                child: GestureDetector(
                  onTap: controller.updateProfile,
                  child: Container(
                    width: double.infinity,
                    height: 52.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D1A3E),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        'Update',
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

              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
