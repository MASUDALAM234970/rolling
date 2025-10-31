// lib/app/core/ApiService/ApiService.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://nonpedagogic-brazenly-desiree.ngrok-free.dev/api/users';

  // SEND OTP
  Future<Map<String, dynamic>> sendOTP({required String emailOrPhone}) async {
    final url = Uri.parse('$baseUrl/send-otp/');
    final body = {'email_or_phone': emailOrPhone};

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'message': data['message'] ?? 'OTP sent'};
      } else {
        return {'success': false, 'message': data['detail'] ?? 'Failed to send OTP'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error'};
    }
  }

  // VERIFY OTP
  Future<Map<String, dynamic>> verifyOTP({
    required String emailOrPhone,
    required String otp,
  }) async {
    final url = Uri.parse('$baseUrl/send-otp/');
    final body = {'email_or_phone': emailOrPhone, 'otp': otp};

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': data,
          'message': 'Verified successfully',
        };
      } else {
        return {
          'success': false,
          'message': data['detail'] ?? data['non_field_errors']?[0] ?? 'Invalid OTP',
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error'};
    }
  }
}