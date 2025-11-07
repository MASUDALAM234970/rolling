import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordController extends GetxController {
  var passwordController = TextEditingController();
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  void onClose() {
    passwordController.dispose();
    super.onClose();
  }
}

class ChangePasswordViews extends StatelessWidget {
  ChangePasswordViews({Key? key}) : super(key: key);

  final controller = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
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
          'Changes Password',
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xff0D1A3E),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h), // Spacing from top

            Obx(
              () => Container(
                width: 365.w,
                height: 57.h,
                child: TextField(
                  onTap: () {},
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xffAEAFB2),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: const Color(0xffF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Color(0xFF676769)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Color(0xFF676769)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Color(0xFF676769),
                        width: 1,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ?  Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            Obx(
              () => Container(
                width: 365.w,
                height: 57.h,
                child: TextField(
                  onTap: () {},
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: GoogleFonts.inter(
                      color: const Color(0xffAEAFB2),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: const Color(0xffF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Color(0xFF676769)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(color: Color(0xFF676769)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Color(0xFF676769),
                        width: 1,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordVisible.value
                            ?  Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: double.infinity,
              height: 57.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0D1A3E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
