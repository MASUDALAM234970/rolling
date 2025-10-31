import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolling/app/core/ApiService/extention/ResetPasswordApiExtension.dart';
import '../../../core/ApiService/ApiService.dart';


// Reset Password Controller
class ResetPasswordController extends GetxController {
  final ApiService _apiService = ApiService();

  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isNewPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // This should be passed from OTP verification screen
  String emailOrPhone = '';

  @override
  void onClose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void toggleNewPasswordVisibility() {
    isNewPasswordVisible.value = !isNewPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Validate inputs
  bool _validateInputs() {
    if (newPasswordController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter new password';
      Get.snackbar(
        'Validation Error',
        errorMessage.value,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
      return false;
    }

    if (newPasswordController.text.length < 6) {
      errorMessage.value = 'Password must be at least 6 characters';
      Get.snackbar(
        'Validation Error',
        errorMessage.value,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
      return false;
    }

    if (confirmPasswordController.text.trim().isEmpty) {
      errorMessage.value = 'Please confirm your password';
      Get.snackbar(
        'Validation Error',
        errorMessage.value,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
      return false;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      errorMessage.value = 'Passwords do not match';
      Get.snackbar(
        'Validation Error',
        errorMessage.value,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
      return false;
    }

    return true;
  }

  // Reset Password
  Future<void> resetPassword() async {
    if (!_validateInputs()) return;

    isLoading.value = true;
    errorMessage.value = '';

    final result = await _apiService.resetPassword(
      emailOrPhone: emailOrPhone,
      newPassword: newPasswordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
    );

    isLoading.value = false;

    if (result['success']) {
      Get.snackbar(
        'Success',
        'Password reset successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );

      // Navigate back to login screen
      // Get.offAll(() => LoginScreen());

      // Or just go back
      await Future.delayed(const Duration(seconds: 1));
      Get.back();
      Get.back();
      Get.back(); // Go back 3 screens to login
    } else {
      errorMessage.value = result['message'];
    }
  }
}