// lib/app/modules/auth/controllers/OTPVerification_Controller.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/ApiService/extention/OTPApiExtension.dart';
import '../views/ResetPasswordScreen.dart';

class OTPVerificationController extends GetxController {
  final ApiService _apiService = ApiService();

  final emailOrPhoneController = TextEditingController();
  final List<TextEditingController> otpControllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(6, (_) => FocusNode());

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

  // FIX: Make it a method, not a getter
  bool _isEmail(String input) => input.contains('@');

  Future<void> sendOTP() async {
    final input = emailOrPhoneController.text.trim();
    if (input.isEmpty) return _showError('Enter email or phone');

    if (_isEmail(input) && !GetUtils.isEmail(input)) {
      return _showError('Invalid email');
    }
    if (!_isEmail(input) && input.length < 10) {
      return _showError('Invalid phone');
    }

    isLoading.value = true;
    final result = await _apiService.sendOTP(emailOrPhone: input);
    isLoading.value = false;

    if (result['success']) {
      enteredEmailOrPhone.value = input;
      isOTPScreen.value = true;
      startCountdown();
      _showSuccess('OTP sent');
      Future.delayed(const Duration(milliseconds: 300), () {
        otpFocusNodes[0].requestFocus();
      });
    } else {
      errorMessage.value = result['message'];
    }
  }

  Future<void> verifyOTP() async {
    final otp = otpControllers.map((c) => c.text).join();
    if (otp.length != 6) return _showError('Enter 6-digit OTP');

    isLoading.value = true;
    final result = await _apiService.verifyOTP(
      emailOrPhone: enteredEmailOrPhone.value,
      otp: otp,
    );
    isLoading.value = false;

    if (result['success']) {
      _showSuccess('Verified!');
      // Get.offAllNamed(Routes.HOME);
    } else {
      errorMessage.value = result['message'];
      _clearOTP();
      otpFocusNodes[0].requestFocus();
    }
  }

  Future<void> resendOTP() async {
    if (!canResend.value) return;
    isLoading.value = true;
    final result = await _apiService.sendOTP(emailOrPhone: enteredEmailOrPhone.value);
    isLoading.value = false;

    if (result['success']) {
      canResend.value = false;
      startCountdown();
      _showSuccess('OTP resent');
    }
  }

  void startCountdown() {
    countdown.value = 60;
    canResend.value = false;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        canResend.value = true;
        t.cancel();
      }
    });
  }

  void onOTPChanged(int index, String value) {
    if (value.length == 1 && index < 5) otpFocusNodes[index + 1].requestFocus();
    if (value.isEmpty && index > 0) otpFocusNodes[index - 1].requestFocus();
  }

  void backToInput() {
    isOTPScreen.value = false;
    errorMessage.value = '';
    _clearOTP();
    _timer?.cancel();
  }

  void _clearOTP() {
    for (var c in otpControllers) c.clear();
  }

  void _showError(String msg) {
    errorMessage.value = msg;
    Get.snackbar('Error', msg, backgroundColor: Colors.red, colorText: Colors.white);
  }

  void _showSuccess(String msg) {
    Get.snackbar(
      'Success',
      msg,
      backgroundColor: Colors.green,  // ✅ Changed to green for success
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );

    Get.to(() => ResetPasswordScreen(
      emailOrPhone: enteredEmailOrPhone.value,  // ✅ Pass the actual email/phone
    ));
  }
}