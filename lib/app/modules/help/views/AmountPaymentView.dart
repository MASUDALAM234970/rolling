import '../controllers/AmountPaymentController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/paymentmethod.dart';

class AmountPaymentView extends GetView<AmountPaymentController> {
  const AmountPaymentView({Key? key}) : super(key: key);

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
          'Amount',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Amount Input Field
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE0E0E0)),
                ),
                child: Text(
                  controller.amount.value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF666666),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Add Payment Method Link
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => controller.addPaymentMethod(),
                child: const Text(
                  'Add payment Method',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF00C896),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Select Payment Method Title
            const Text(
              'Select payment method',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A1A),
              ),
            ),

            const SizedBox(height: 20),

            // Payment Methods List
            Obx(
              () => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.paymentMethods.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final method = controller.paymentMethods[index];
                  final isSelected =
                      controller.selectedPaymentIndex.value == index;
                  return _PaymentMethodCard(
                    method: method,
                    isSelected: isSelected,
                    onTap: () => controller.selectPaymentMethod(index),
                  );
                },
              ),
            ),

            const Spacer(),

            // Confirm Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => controller.confirmPayment(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1B2B48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'Confirm',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// ==================== PAYMENT METHOD CARD WIDGET ====================
class _PaymentMethodCard extends StatelessWidget {
  final PaymentMethod method;
  final bool isSelected;
  final VoidCallback onTap;

  const _PaymentMethodCard({
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE0F5EC) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF00C896)
                : const Color(0xFFE0E0E0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: _getIconBackgroundColor(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(method.icon, color: _getIconColor(), size: 32),
            ),

            const SizedBox(width: 16),

            // Name and Expiry
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  method.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  method.expires,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconBackgroundColor() {
    if (method.name == 'Credit Crad') {
      return const Color(0xFFFFEED6);
    } else if (method.name == 'Cash') {
      return const Color(0xFFD4F4DD);
    } else {
      return const Color(0xFFD5F3F0);
    }
  }

  Color _getIconColor() {
    if (method.name == 'Credit Crad') {
      return const Color(0xFFFFA726);
    } else if (method.name == 'Cash') {
      return const Color(0xFF66BB6A);
    } else {
      return const Color(0xFF4DD0E1);
    }
  }
}
