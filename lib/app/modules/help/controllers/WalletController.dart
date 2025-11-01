// ==================== CONTROLLER ====================
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/transaction.dart';

class WalletController extends GetxController {
  final RxDouble availableBalance = 500.0.obs;
  final RxDouble totalExpend = 200.0.obs;
  final RxList<Transaction> transactions = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() {
    transactions.value = [
      Transaction(
        name: 'Welton',
        time: 'Today at 09:20 am',
        amount: 570.00,
        isExpense: true,
      ),
      Transaction(
        name: 'Nathsam',
        time: 'Today at 09:20 am',
        amount: 570.00,
        isExpense: false,
      ),
      Transaction(
        name: 'Welton',
        time: 'Today at 09:20 am',
        amount: 570.00,
        isExpense: true,
      ),
      Transaction(
        name: 'Nathsam',
        time: 'Today at 09:20 am',
        amount: 570.00,
        isExpense: false,
      ),
      Transaction(
        name: 'Nathsam',
        time: 'Today at 09:20 am',
        amount: 570.00,
        isExpense: false,
      ),
    ];
  }

  void addMoney() {
    // Navigate to add money screen or show dialog
    Get.snackbar(
      'Add Money',
      'Add money feature',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void viewAllHistory() {
    // Navigate to full history screen
    Get.snackbar(
      'History',
      'View all transactions',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

// ==================== VIEW ====================
class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);

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
          'Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // Balance Cards
              Row(
                children: [
                  Expanded(
                    child: _BalanceCard(
                      amount: controller.availableBalance,
                      label: 'Available Balance',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _BalanceCard(
                      amount: controller.totalExpend,
                      label: 'Total Expend',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Add Money Button
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => controller.addMoney(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1B2B48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Add Money',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // History Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'History',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.viewAllHistory(),
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF00C896),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Transaction List
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.transactions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final transaction = controller.transactions[index];
                    return _TransactionCard(transaction: transaction);
                  },
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

// ==================== BALANCE CARD WIDGET ====================
class _BalanceCard extends StatelessWidget {
  final RxDouble amount;
  final String label;

  const _BalanceCard({required this.amount, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFE0F5EC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00C896), width: 2),
      ),
      child: Column(
        children: [
          Obx(
            () => Text(
              '\$${amount.value.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1B2B48),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF4A5568),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ==================== TRANSACTION CARD WIDGET ====================
class _TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const _TransactionCard({required this.transaction});

  @override
  Widget build(BuildContext context) {
    final bool isExpense = transaction.isExpense;
    final Color iconBgColor = isExpense
        ? const Color(0xFFFFE5E5)
        : const Color(0xFFE0F5EC);
    final Color iconColor = isExpense
        ? const Color(0xFFFF4444)
        : const Color(0xFF00C896);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00C896), width: 1.5),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isExpense ? Icons.arrow_upward : Icons.arrow_downward,
                color: iconColor,
                size: 24,
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Name and Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  transaction.time,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8E8E93),
                  ),
                ),
              ],
            ),
          ),

          // Amount
          Text(
            '${isExpense ? '-' : ''}\$${transaction.amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: isExpense
                  ? const Color(0xFF1A1A1A)
                  : const Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== BINDING ====================
class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
  }
}

// ==================== USAGE ====================
/*
// In your routes:
GetPage(
  name: '/wallet',
  page: () => const WalletView(),
  binding: WalletBinding(),
),

// Navigate:
Get.toNamed('/wallet');
*/
