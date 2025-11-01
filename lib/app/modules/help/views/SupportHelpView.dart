import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/SupportHelpController.dart';

class SupportHelpView extends GetView<SupportHelpController> {
  const SupportHelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Support & Help',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 60),

            // WhatsApp Icon Circle
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFFD5F3E5),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/whatsapp_icon.png', // Use actual WhatsApp icon
                  width: 80,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.support_agent,
                      size: 80,
                      color: Color(0xFF25D366),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 60),

            // Email Section
            const Text(
              'Shoot us your complain through email',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF666666),
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),

            GestureDetector(
              onTap: () => controller.launchEmailSupport(),
              child: Obx(
                    () =>
                    Text(
                      controller.supportEmail.value,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color(0xFF1A1A1A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              ),
            ),

            const Spacer(),

            // Need Help Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Need Help?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: _SupportButton(
                    icon: Icons.phone_outlined,
                    label: 'Call Support',
                    onTap: () => controller.launchPhoneSupport(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _SupportButton(
                    icon: Icons.chat_bubble_outline,
                    label: 'Live Chat',
                    iconColor: const Color(0xFF25D366),
                    onTap: () => controller.launchWhatsAppChat(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _SupportButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final VoidCallback onTap;

  const _SupportButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFE0E0E0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: iconColor ?? const Color(0xFF1A1A1A),
              size: 22,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1A1A1A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
