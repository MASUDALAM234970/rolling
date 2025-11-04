import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/ApiService/extention/OTPApiExtension.dart';
import '../views/ResetPasswordScreen.dart';

class OTPVerificationController extends GetxController {
  final ApiService _apiService = ApiService();

  // Input controllers
  final emailOrPhoneController = TextEditingController();
  final List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

  // Observables
  var isLoading = false.obs;
  var isOTPScreen = false.obs;
  var errorMessage = ''.obs;
  var countdown = 60.obs;
  var canResend = false.obs;
  var enteredEmailOrPhone = ''.obs;

  Timer? _timer;

  @override
  void onClose() {
    emailOrPhoneController.dispose();
    for (var c in otpControllers) c.dispose();
    for (var f in otpFocusNodes) f.dispose();
    _timer?.cancel();
    super.onClose();
  }

  // Helper: Check if input is email
  bool _isEmail(String input) => input.contains('@');

  // Send OTP to email or phone
  Future<void> sendOTP() async {
    final input = emailOrPhoneController.text.trim();
    if (input.isEmpty) {
      return _showError('Please enter email or phone number');
    }

    if (_isEmail(input) && !GetUtils.isEmail(input)) {
      return _showError('Please enter a valid email');
    }
    if (!_isEmail(input) && input.length < 10) {
      return _showError('Please enter a valid phone number');
    }

    isLoading.value = true;
    final result = await _apiService.sendOTP(emailOrPhone: input);
    isLoading.value = false;

    if (result['success']) {
      enteredEmailOrPhone.value = input;
      isOTPScreen.value = true;
      startCountdown();
      _showSuccess('OTP sent successfully!');

      // Auto-focus first OTP field
      Future.delayed(const Duration(milliseconds: 300), () {
        if (otpFocusNodes.isNotEmpty) {
          otpFocusNodes[0].requestFocus();
        }
      });
    } else {
      _showError(result['message'] ?? 'Failed to send OTP');
    }
  }

  // Verify entered OTP
  Future<void> verifyOTP() async {
    final otp = otpControllers.map((c) => c.text).join();

    if (otp.length != 6) {
      return _showError('Please enter 6-digit OTP');
    }

    if (enteredEmailOrPhone.value.isEmpty) {
      return _showError('Session expired. Please try again.');
    }

    isLoading.value = true;
    final result = await _apiService.verifyOTP(
      emailOrPhone: enteredEmailOrPhone.value,
      otp: otp,
    );
    isLoading.value = false;

    if (result['success']) {
      // Only navigate after successful verification
      Get.snackbar(
        'Success',
        'OTP Verified!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );

      // Navigate to Reset Password Screen
      Get.off(() => ResetPasswordScreen(
        emailOrPhone: enteredEmailOrPhone.value,
      ));
    } else {
      final msg = result['message'] ?? 'Invalid or expired OTP';
      errorMessage.value = msg;
      _showError(msg);
      _clearOTP();
      if (otpFocusNodes.isNotEmpty) {
        otpFocusNodes[0].requestFocus();
      }
    }
  }

  // Resend OTP
  Future<void> resendOTP() async {
    if (!canResend.value) return;

    isLoading.value = true;
    final result = await _apiService.sendOTP(emailOrPhone: enteredEmailOrPhone.value);
    isLoading.value = false;

    if (result['success']) {
      canResend.value = false;
      startCountdown();
      _showSuccess('OTP resent successfully!');
      _clearOTP();
      Future.delayed(const Duration(milliseconds: 100), () {
        otpFocusNodes[0].requestFocus();
      });
    } else {
      _showError(result['message'] ?? 'Failed to resend OTP');
    }
  }

  // Start 60-second countdown
  void startCountdown() {
    countdown.value = 60;
    canResend.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  // Handle OTP input field changes (auto-move focus)
  void onOTPChanged(int index, String value) {
    if (value.length == 1 && index < 5) {
      otpFocusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      otpFocusNodes[index - 1].requestFocus();
    }

    // Auto-submit when 6 digits are entered
    if (otpControllers.every((c) => c.text.isNotEmpty)) {
      verifyOTP();
    }
  }

  // Go back to email/phone input screen
  void backToInput() {
    isOTPScreen.value = false;
    errorMessage.value = '';
    _clearOTP();
    _timer?.cancel();
    emailOrPhoneController.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      // Optional: focus email/phone field
    });
  }

  // Clear all OTP fields
  void _clearOTP() {
    for (var controller in otpControllers) {
      controller.clear();
    }
  }

  // Show error with snackbar
  void _showError(String msg) {
    errorMessage.value = msg;
    Get.snackbar(
      'Error',
      msg,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );
  }

  // Show success message (no navigation here)
  void _showSuccess(String msg) {
    Get.snackbar(
      'Success',
      msg,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );
  }
}