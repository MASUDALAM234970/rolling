// lib/app/modules/auth/views/verification_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/OTPVerification_Controller.dart';

class VerificationScreen extends StatelessWidget {
  final OTPVerificationController controller = Get.put(
    OTPVerificationController(),
  );

  VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff676769),
            size: 16,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Back',
          style: GoogleFonts.poppins(
            color: Color(0xff676769),
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Obx(
        () => controller.isOTPScreen.value
            ? _buildOTPScreen()
            : _buildInputScreen(),
      ),
    );
  }

  Widget _buildInputScreen() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verification email or phone\nnumber',
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0D1A3E),
              ),
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 57.h,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: TextField(
                  // controller: controller.emailOrPhoneController,
                  // keyboardType: TextInputType.emailAddress,
                  controller: controller.emailOrPhoneController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email or Phone Number',
                    hintStyle: GoogleFonts.inter(
                      color: Color(0xffAEAFB2),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: Color(0xffF5F6FA),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xFF676769)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: Color(0xFF676769)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: const BorderSide(
                        color: Color(0xFF676769),
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.sendOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF0D1A3E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'Send OTP',
                          style: GoogleFonts.inter(
                            color: Color(0xffFFFFFF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
              ),
            ),
            _buildError(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPScreen() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Phone verification',
              style: GoogleFonts.inter(
                color: Color(0xff414141),
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter your OTP code',
              style: GoogleFonts.inter(
                color: Color(0xffA0A0A0),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (i) => Container(
                  width: 48.w,
                  height: 48.h,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  child: TextField(
                    controller: controller.otpControllers[i],
                    focusNode: controller.otpFocusNodes[i],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: GoogleFonts.inter(
                      color: Color(0xff0D1A3E),
                      fontSize: 1.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Color(0xffF5F6FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: const BorderSide(
                          color: Color(0xFF1E3A5F),
                          width: 1,
                        ),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (v) => controller.onOTPChanged(i, v),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code? ",
                    style: GoogleFonts.inter(
                      color: Color(0xff5A5A5A),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  controller.canResend.value
                      ? GestureDetector(
                          onTap: controller.resendOTP,
                          child: const Text(
                            'Resend again',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : Text(
                          'Resend (${controller.countdown.value}s)',
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                ],
              ),
            ),
            const Spacer(),
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: controller.isLoading.value
                      ? null
                      : controller.verifyOTP,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E3A5F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ),
            _buildError(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return Obx(
      () => controller.errorMessage.value.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error_outline, color: Colors.red[700], size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: Colors.red[700], fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
