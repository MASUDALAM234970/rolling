import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/HomeController.dart';
import '../model/ServiceCategory.dart';
import 'NavbarView.dart';

// ==================== VIEW ====================
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'App Rolling',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.notifications_outlined,
                            size: 28,
                          ),
                          onPressed: () => controller.onNotificationTap(),
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Search Bar with Later Button
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8E8E8),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color(0xFF666666),
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'S',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => controller.onLaterTap(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: const Color(0xFFE0E0E0)),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Color(0xFF1A1A1A),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Later',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF1A1A1A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Suggestions Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Suggestions',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0D1A3E),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => controller.onSeeAllSuggestions(),
                      child: Text(
                        'See all',
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF0D1A3E),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Suggestions Grid
                Obx(
                  () => SizedBox(
                    height: 76,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.suggestions.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final suggestion = controller.suggestions[index];
                        return _SuggestionCard(
                          name: suggestion.name,
                          icon: suggestion.icon,
                          onTap: () => controller.onServiceTap(suggestion.name),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: 25.h),

                // More ways to use Section
                Text(
                  'More ways to use',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D1A3E),
                  ),
                ),

                const SizedBox(height: 16),

                Obx(
                  () => SizedBox(
                    height: 260,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.moreWaysToUse.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final card = controller.moreWaysToUse[index];
                        return _PromotionCard(
                          card: card,
                          onTap: () => controller.onPromotionTap(card.title),
                        );
                      },
                    ),
                  ),
                ),

              //  const SizedBox(height: 10),

                // Save everyday Section
                 Text(
                  'Save everyday',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0D1A3E),
                  ),
                ),

                const SizedBox(height: 16),

                Obx(
                  () => SizedBox(
                    height: 260,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.saveEveryday.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final card = controller.saveEveryday[index];
                        return _PromotionCard(
                          card: card,
                          onTap: () => controller.onPromotionTap(card.title),
                        );
                      },
                    ),
                  ),
                ),

               //const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  final String name;
  final String icon;
  final VoidCallback onTap;

  const _SuggestionCard({
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 85.w,
        height: 64.h,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFFE7E8EC),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 26, height: 26),
            // const SizedBox(height: 8),
            Text(
              name,
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF000000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== PROMOTION CARD WIDGET ====================
class _PromotionCard extends StatelessWidget {
  final PromotionCard card;
  final VoidCallback onTap;

  const _PromotionCard({required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 216.w,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Container(
                height: 120,
                decoration: const BoxDecoration(color: Color(0xFFE8E8E8)),
                child: Image.asset(
                  card.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.image, weight: 10, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(

                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          card.title,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(right: 50,top: 16),
                       child: Icon(Icons.arrow_forward, size: 20),
                     ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  card.description,
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4C4C4C),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
