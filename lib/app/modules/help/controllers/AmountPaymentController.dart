import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/paymentmethod.dart';

class AmountPaymentController extends GetxController {
  final RxString amount = '\$200'.obs;
  final RxInt selectedPaymentIndex = 0.obs;
  final RxList<PaymentMethod> paymentMethods = <PaymentMethod>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPaymentMethods();
  }

  void loadPaymentMethods() {
    paymentMethods.value = [
      PaymentMethod(
        name: 'Credit Crad',
        expires: 'Expires: 12/26',
        icon: Icons.credit_card,
      ),
      PaymentMethod(name: 'Cash', expires: 'Expires: 12/26', icon: Icons.money),
      PaymentMethod(
        name: 'Pay Later',
        expires: 'Expires: 12/26',
        icon: Icons.schedule,
      ),
    ];
  }

  void selectPaymentMethod(int index) {
    selectedPaymentIndex.value = index;
  }

  void addPaymentMethod() {
    // Add payment method logic
  }

  void confirmPayment() {
    // Confirm payment logic
  }
}
