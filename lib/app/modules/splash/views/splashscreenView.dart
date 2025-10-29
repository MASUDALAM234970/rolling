import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_view_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D1A3E),
      body: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 240.0).r,
            child: Image.asset(
              "assets/splash/car.png",
              width: 60.w,
              height: 60.h,
              color: Color(0xffffffff),
            ),
          ),
          SizedBox(height: 19.h),
          Text(
            "App Rolling",
            style: GoogleFonts.inter(
              color: Color(0xffffffff),
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 55.0,
                //  right: 10,
                  top: 273,
                ).r,
                child: Container(
                  width: 44.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: Color(0x993d4865),
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/splash/whats_up.png",
                      width: 24.w,
                      height: 23.98.h,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 185, right: 20, top: 273).r,
                child: Container(
                  width: 44.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                    color: Color(0x993d4865),
                    borderRadius: BorderRadius.circular(8.r),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/splash/headset-help.png",
                      width: 24.w,
                      height: 23.98.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
