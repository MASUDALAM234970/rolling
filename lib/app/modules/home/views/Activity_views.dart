import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/ActivityControlle.dart';

class ActivityView extends GetView<ActivityController> {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  child: Text(
                    'Activity',
                    style: GoogleFonts.inter(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0D1A3E),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                // Past section with filter button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Past',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0D1A3E),
                        ),
                      ),
                      InkWell(
                        onTap: controller.toggleFilter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: Color(0xffF5F6FA),
                          ),
                          child: Image.asset(
                            "assets/home/acvitiy.png",
                            width: 30.w,
                            height: 30.h,
                            fit: BoxFit.contain,
                            // color: Colors.green // Optional: tint when active
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Empty state
                Expanded(
                  child: Obx(() {
                    if (controller.activities.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'You don\'t have any recent activity',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: Color(0xFF676769),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    }
                    // Activity list would go here
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: controller.activities.length,
                      itemBuilder: (context, index) {
                        return Container(); // Activity item widget
                      },
                    );
                  }),
                ),
              ],
            ),
            // Filter bottom sheet
            Obx(
              () => controller.isFilterVisible.value
                  ? _buildFilterBottomSheet(context)
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
      // Bottom navigation bar
    );
  }

  Widget _buildFilterBottomSheet(BuildContext context) {
    return GestureDetector(
      onTap: controller.toggleFilter,
      child: Container(
        color: Color(0x40000000),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {}, // Prevent closing when tapping the sheet
              child: Container(
                width: 393.w,
                height: 330.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle bar
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Container(
                            width: 140.w,
                            height: 6.h,
                            decoration: BoxDecoration(
                              color: Color(0xff676769),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 75, right: 2),
                          child: IconButton(
                            onPressed: controller.toggleFilter,
                            icon: Icon(
                              Icons.close,
                              color: Color(0xFFC8102E),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Close button
                    SizedBox(height: 0.h),
                    // Title
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Filter by...',
                        style: GoogleFonts.inter(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF0D1A3E),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(color: Color(0xffDFE0E4)),
                    const SizedBox(height: 10),
                    // Services label
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Services',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0D1A3E),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Filter chips
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Obx(
                          () => Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: controller.filterOptions.map((filter) {
                              final isSelected =
                                  controller.selectedFilter.value == filter;
                              return GestureDetector(
                                onTap: () => controller.selectFilter(filter),
                                child: Container(
                               
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Color(0xFF0D1A3E)
                                        : Color(0xffF5F6FA),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: isSelected
                                          ? Color(0xFF1A1F36)
                                          : Color(0xFFE4E9F2),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    filter,
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: isSelected
                                          ? Colors.white
                                          : Color(0xFF1A1F36),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Apply button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SizedBox(
                        width: double.infinity,
                        height: 57.h,
                        child: ElevatedButton(
                          onPressed: controller.applyFilter,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF0D1A3E),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Apply',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
