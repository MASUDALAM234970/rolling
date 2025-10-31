import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../ApiService.dart';

extension ResetPasswordApiExtension on ApiService {
  static const String baseUrl =
      'https://nonpedagogic-brazenly-desiree.ngrok-free.dev/api/users';

  Future<Map<String, dynamic>> resetPassword({
    required String emailOrPhone,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      print('🔵 Reset Password Request URL: $baseUrl/reset-password//');
      print(
        '🔵 Reset Password Request Body: ${jsonEncode({'email_or_phone': emailOrPhone, 'new_password': newPassword, 'confirm_password': confirmPassword})}',
      );

      final response = await http.post(
        Uri.parse('$baseUrl/change-password/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email_or_phone': emailOrPhone,
          'new_password': newPassword,
          'confirm_password': confirmPassword,
        }),
      );

      print('🔵 Reset Password Response Status: ${response.statusCode}');
      print('🔵 Reset Password Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Password reset successfully',
        };
      } else {
        final errorData = jsonDecode(response.body);
        String errorMessage = 'Failed to reset password';

        if (errorData['non_field_errors'] != null) {
          errorMessage = errorData['non_field_errors'][0];
        } else if (errorData['message'] != null) {
          errorMessage = errorData['message'];
        } else if (errorData['error'] != null) {
          errorMessage = errorData['error'];
        } else if (errorData['new_password'] != null) {
          errorMessage = errorData['new_password'][0];
        } else if (errorData['confirm_password'] != null) {
          errorMessage = errorData['confirm_password'][0];
        }

        print('🔴 Reset Password Error: $errorMessage');

        Get.snackbar(
          'Error',
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
        );

        return {'success': false, 'message': errorMessage};
      }
    } catch (e) {
      print('🔴 Reset Password Exception: ${e.toString()}');
      Get.snackbar(
        'Network Error',
        'Unable to connect to server',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(10),
      );
      return {'success': false, 'message': 'Network error: ${e.toString()}'};
    }
  }
}
