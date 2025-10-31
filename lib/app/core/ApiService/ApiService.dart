// ======================== API SERVICE ========================
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'https://nonpedagogic-brazenly-desiree.ngrok-free.dev/api/users';
 // static const String baseUrl = 'http://127.0.0.1:8000/api/users';

  // Login API call
  Future<Map<String, dynamic>> login({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      print('🔵 Login Request URL: $baseUrl/login/');
      print('🔵 Login Request Body: ${jsonEncode({
        'email_or_phone': emailOrPhone,
        'password': password,
      })}');

      final response = await http.post(
        Uri.parse('$baseUrl/login/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'email_or_phone': emailOrPhone,
          'password': password,
        }),
      );

      print('🔵 Login Response Status: ${response.statusCode}');
      print('🔵 Login Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Login successful',
        };
      } else {
        final errorData = jsonDecode(response.body);

        // Handle different error formats
        String errorMessage = 'Login failed';

        if (errorData['non_field_errors'] != null) {
          errorMessage = errorData['non_field_errors'][0];
        } else if (errorData['message'] != null) {
          errorMessage = errorData['message'];
        } else if (errorData['error'] != null) {
          errorMessage = errorData['error'];
        } else if (errorData['detail'] != null) {
          errorMessage = errorData['detail'];
        }

        print('🔴 Login Error: $errorMessage');

        // Show user-friendly error message
        Get.snackbar(
          'Login Failed',
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
        );

        return {
          'success': false,
          'message': errorMessage,
        };
      }
    } catch (e) {
      print('🔴 Login Exception: ${e.toString()}');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }

  // Sign Up API call
  Future<Map<String, dynamic>> signUp({
    required String fullName,
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      print('🔵 SignUp Request URL: $baseUrl/register/');
      print('🔵 SignUp Request Body: ${jsonEncode({
        'full_name': fullName,
        'email_or_phone': emailOrPhone,
        'password': password,
      })}');

      final response = await http.post(
        Uri.parse('$baseUrl/register/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'full_name': fullName,
          'email_or_phone': emailOrPhone,
          'password': password,
        }),
      );

      print('🔵 SignUp Response Status: ${response.statusCode}');
      print('🔵 SignUp Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Registration successful',
        };
      } else {
        final errorData = jsonDecode(response.body);

        // Handle different error formats
        String errorMessage = 'Registration failed';

        if (errorData['non_field_errors'] != null) {
          errorMessage = errorData['non_field_errors'][0];
        } else if (errorData['message'] != null) {
          errorMessage = errorData['message'];
        } else if (errorData['error'] != null) {
          errorMessage = errorData['error'];
        } else if (errorData['detail'] != null) {
          errorMessage = errorData['detail'];
        }

        print('🔴 SignUp Error: $errorMessage');

        // Show user-friendly error message
        Get.snackbar(
          'Registration Failed',
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
        );

        return {
          'success': false,
          'message': errorMessage,
        };
      }
    } catch (e) {
      print('🔴 SignUp Exception: ${e.toString()}');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }

  // Gmail Login API call
  Future<Map<String, dynamic>> loginWithGmail(String token) async {
    try {
      print('🔵 Gmail Login Request URL: $baseUrl/login/gmail/');
      print('🔵 Gmail Login Token: $token');

      final response = await http.post(
        Uri.parse('$baseUrl/login/gmail/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'token': token,
        }),
      );

      print('🔵 Gmail Login Response Status: ${response.statusCode}');
      print('🔵 Gmail Login Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Gmail login successful',
        };
      } else {
        print('🔴 Gmail Login Failed');
        return {
          'success': false,
          'message': 'Gmail login failed',
        };
      }
    } catch (e) {
      print('🔴 Gmail Login Exception: ${e.toString()}');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }

  // Facebook Login API call
  Future<Map<String, dynamic>> loginWithFacebook(String token) async {
    try {
      print('🔵 Facebook Login Request URL: $baseUrl/login/facebook/');
      print('🔵 Facebook Login Token: $token');

      final response = await http.post(
        Uri.parse('$baseUrl/login/facebook/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'token': token,
        }),
      );

      print('🔵 Facebook Login Response Status: ${response.statusCode}');
      print('🔵 Facebook Login Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
          'message': 'Facebook login successful',
        };
      } else {
        print('🔴 Facebook Login Failed');
        return {
          'success': false,
          'message': 'Facebook login failed',
        };
      }
    } catch (e) {
      print('🔴 Facebook Login Exception: ${e.toString()}');
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }
}

// ======================== STORAGE SERVICE ========================
class StorageService {
  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<void> saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', jsonEncode(userData));
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}