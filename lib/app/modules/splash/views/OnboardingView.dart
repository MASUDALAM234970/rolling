import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling/app/modules/splash/controllers/onboarding_view_controller.dart';

class Onboardingview extends StatefulWidget {
  const Onboardingview({super.key});

  @override
  State<Onboardingview> createState() => _OnboardingviewState();
}

class _OnboardingviewState extends State<Onboardingview> {
  @override
  Widget build(BuildContext context) {
    final OnboardingController _controller = Get.put(OnboardingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          // Illustration
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/splash/onboarding.png',
              height: 208.h,
              width: 370.w,
            ),
          ),
          SizedBox(height: 12.h),
          // Title
          Text(
            'Anywhere you are',
            style: GoogleFonts.inter(
              fontSize: 22.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff0D1A3E),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 2.h),
          // Description
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text(
              'With our ride-sharing platform, you can count  on safe drivers, fair prices, and a smooth experience every time.',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: Color(0xff87878A),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
            SizedBox(height: 170.h,),
          // Users Account Button
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => _controller.navigateToUserAccount,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D1A3E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Users Account',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Drivers Account Button
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () => _controller.navigateToDriverAccount,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF0D1A3E), width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Drivers Account',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0D1A3E),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
