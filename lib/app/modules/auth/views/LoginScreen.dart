import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/LoginController.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              // Title
              Text(
                'Log In with your email or\nphone number',
                style: GoogleFonts.inter(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0D1A3E),
                ),
              ),
              SizedBox(height: 25.h),

              // Email/Phone Number Field
              Text(
                'Enter Email/Phone Number',
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0D1A3E),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                width: 365.w,
                height: 57.h,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextField(
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

              SizedBox(height: 18.h),

              // Password Field
              Text(
                'Enter Your Password',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF0D1A3E),
                ),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => Container(
                  width: 365.w,
                  height: 57.h,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextField(
                      controller: controller.passwordController,
                      obscureText: !controller.isPasswordVisible.value,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
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

                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey[600],
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: controller.navigateToForgetPassword,
                  child: const Text(
                    'Forget password?',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Login Button
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : controller.login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A5F),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
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
                        : const Text(
                            'Log In',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ),

              // Error Message Display
              Obx(
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
                              Icon(
                                Icons.error_outline,
                                color: Colors.red[700],
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  controller.errorMessage.value,
                                  style: TextStyle(
                                    color: Colors.red[700],
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              const SizedBox(height: 30),

              // Divider with "or"
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey[300])),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'or',
                      style: TextStyle(color: Colors.grey[500], fontSize: 14),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey[300])),
                ],
              ),

              const SizedBox(height: 30),

              // Gmail Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: controller.loginWithGmail,
                  icon: const Icon(Icons.email, color: Colors.red, size: 24),
                  label: const Text(
                    'Sign up with Gmail',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Facebook Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton.icon(
                  onPressed: controller.loginWithFacebook,
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 24,
                  ),
                  label: const Text(
                    'Sign up with Facebook',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Sign Up Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.grey[600], fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: controller.navigateToSignUp,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF1A1A1A),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
