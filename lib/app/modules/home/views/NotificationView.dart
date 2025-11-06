import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF0D1A3E),
            size: 20,
          ),
        ),
        title: Text(
          'Notification',
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0D1A3E),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        children: [
          // Today Section
          _buildSectionHeader('Today'),
          SizedBox(height: 12.h),

          _buildNotificationItem(
            title: 'Payment confirm',
            description: 'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
            time: '15 min ago.',
            isCancel: false,
          ),

          SizedBox(height: 12.h),

          _buildNotificationItem(
            title: 'Payment confirm',
            description: 'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
            time: '15 min ago.',
            isCancel: false,
          ),

          SizedBox(height: 24.h),

          // Yesterday Section
          _buildSectionHeader('Yesterday'),
          SizedBox(height: 12.h),

          _buildNotificationItem(
            title: 'Payment Cancel',
            description: 'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
            time: '15 min ago.',
            isCancel: true,
          ),

          SizedBox(height: 12.h),

          _buildNotificationItem(
            title: 'Payment confirm',
            description: 'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
            time: '15 min ago.',
            isCancel: false,
          ),

          SizedBox(height: 12.h),

          _buildNotificationItem(
            title: 'Payment confirm',
            description: 'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
            time: '15 min ago.',
            isCancel: false,
          ),

          SizedBox(height: 12.h),

          _buildNotificationItem(
            title: 'Payment confirm',
            description: 'Lorem ipsum dolor sit amet consectetur. Ultrici es tincidunt eleifend vitae',
            time: '15 min ago.',
            isCancel: false,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: Color(0xFF0D1A3E),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String description,
    required String time,
    required bool isCancel,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6FA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: isCancel ? Color(0xFFC8102E) : Color(0xFF0D1A3E),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF9CA3AF),
              height: 1.5,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}