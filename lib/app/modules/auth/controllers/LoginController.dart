import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ApiService/ApiService.dart';
import '../views/OTPVerificationScreen.dart';
import '../views/SignUpScreen.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();

  final emailOrPhoneController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Validate inputs
  bool _validateInputs() {
    if (emailOrPhoneController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter email or phone number';
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

    if (passwordController.text.trim().isEmpty) {
      errorMessage.value = 'Please enter password';
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

    if (passwordController.text.length < 6) {
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

    return true;
  }

  // Login with email/phone
  Future<void> login() async {
    if (!_validateInputs()) return;

    isLoading.value = true;
    errorMessage.value = '';

    final result = await _apiService.login(
      emailOrPhone: emailOrPhoneController.text.trim(),
      password: passwordController.text.trim(),
    );

    isLoading.value = false;

    if (result['success']) {
      // Save token and user data
      if (result['data'] != null && result['data']['token'] != null) {
        await StorageService.saveToken(result['data']['token']);
        await StorageService.saveUserData(result['data']['user'] ?? {});
      }

      Get.snackbar(
        'Success',
        result['message'],
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );

      // Navigate to home screen
      // Get.offAll(() => HomeScreen());
    } else {
      errorMessage.value = result['message'];
      // Error already shown in API service
    }
  }

  // Login with Gmail
  Future<void> loginWithGmail() async {
    isLoading.value = true;

    // TODO: Implement Google Sign In
    Get.snackbar(
      'Info',
      'Gmail login implementation needed',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );

    isLoading.value = false;
  }

  // Login with Facebook
  Future<void> loginWithFacebook() async {
    isLoading.value = true;

    // TODO: Implement Facebook Sign In
    Get.snackbar(
      'Info',
      'Facebook login implementation needed',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );

    isLoading.value = false;
  }

  // Navigate to Sign Up
  void navigateToSignUp() {
    Get.to(() => SignUpScreen());
  }

  // Navigate to Forget Password
  void navigateToForgetPassword() {
    Get.snackbar(
      'Info',
      'Navigate to Forget Password screen',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );

    Get.to(() => VerificationScreen());
  }
}
