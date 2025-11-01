import 'package:get/get.dart';


import '../controllers/AmountPaymentController.dart';

class AmountPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AmountPaymentController>(() => AmountPaymentController());
  }
}