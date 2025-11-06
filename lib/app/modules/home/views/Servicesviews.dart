import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Servicesviews extends StatefulWidget {
  const Servicesviews({super.key});

  @override
  State<Servicesviews> createState() => _ServicesviewsState();
}

class _ServicesviewsState extends State<Servicesviews> {
  int? _selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text(
                "Services",
                style: GoogleFonts.inter(
                  color: const Color(0xff0D1A3E),
                  fontWeight: FontWeight.w700,
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Go anywhere, get anything",
                style: GoogleFonts.inter(
                  color: const Color(0xff0D1A3E),
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 30.h),

              // Service Cards
              Row(
                children: [
                  _buildServiceCard(
                    index: 0,
                    imagePath: "assets/home/car_one.png",
                    label: "Car",
                    isSelected: _selectedIndex == 0,
                  ),
                  SizedBox(width: 16.w),
                  _buildServiceCard(
                    index: 1,
                    imagePath: "assets/home/bike.png",
                    label: "Bike",
                    isSelected: _selectedIndex == 1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required int index,
    required String imagePath,
    required String label,
    required bool isSelected,
  }) {
    final Color bgColor = isSelected ? const Color(0xffE7F8F2) : const Color(0xffF5F6FA);
    final Color borderColor = isSelected ? const Color(0xff10B981) : const Color(0xff0D1A3E);
    final Color textColor = isSelected ? const Color(0xff10B981) : const Color(0xff0D1A3E);

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedIndex = index),
        child: Container(
          height: 160.h,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image without text inside
              Image.asset(
                imagePath,
                width: 101.w,
                height: 65.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 4.h),
              // Only show label if image does NOT contain text
              // OR: just keep it and ensure your PNGs have NO text
              Text(
                label,
                style: GoogleFonts.inter(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}