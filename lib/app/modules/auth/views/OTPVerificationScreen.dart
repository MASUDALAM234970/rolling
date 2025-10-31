// lib/app/modules/auth/views/verification_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../controllers/OTPVerification_Controller.dart';


class VerificationScreen extends StatelessWidget {
  final OTPVerificationController controller = Get.put(OTPVerificationController());

  VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: controller.backToInput,
        ),
        title: const Text('Back',
            style: TextStyle(color: Colors.grey, fontSize: 16)),
      ),
      body: Obx(() => controller.isOTPScreen.value
          ? _buildOTPScreen()
          : _buildInputScreen()),
    );
  }

  Widget _buildInputScreen() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Verification email or phone\nnumber',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            TextField(
              controller: controller.emailOrPhoneController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email or phone number',
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                    const BorderSide(color: Color(0xFF1E3A5F), width: 2)),
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              ),
            ),
            const Spacer(),
            Obx(() => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed:
                controller.isLoading.value ? null : controller.sendOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A5F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2))
                    : const Text('Send OTP',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            )),
            _buildError(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPScreen() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Text('Phone verification',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text('Enter your OTP code',
                style: TextStyle(fontSize: 16, color: Colors.grey[500])),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                    (i) => Container(
                  width: 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: TextField(
                    controller: controller.otpControllers[i],
                    focusNode: controller.otpFocusNodes[i],
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                              color: Color(0xFF1E3A5F), width: 2)),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (v) => controller.onOTPChanged(i, v),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't receive code? ",
                    style: TextStyle(color: Colors.grey[500])),
                controller.canResend.value
                    ? GestureDetector(
                  onTap: controller.resendOTP,
                  child: const Text('Resend again',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                )
                    : Text('Resend (${controller.countdown.value}s)',
                    style: TextStyle(color: Colors.grey[400])),
              ],
            )),
            const Spacer(),
            Obx(() => SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E3A5F),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Verify',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            )),
            _buildError(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildError() {
    return Obx(() => controller.errorMessage.value.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.red[50],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red[200]!),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red[700], size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(controller.errorMessage.value,
                  style:
                  TextStyle(color: Colors.red[700], fontSize: 14)),
            ),
          ],
        ),
      ),
    )
        : const SizedBox.shrink());
  }
}