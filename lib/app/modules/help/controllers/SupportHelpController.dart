
// ==================== CONTROLLER ====================
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class SupportHelpController extends GetxController {
  final RxString supportEmail = 'Support@approlling.com'.obs;
  final RxString supportPhone = '+1234567890'.obs;
  final RxString whatsappNumber = '1234567890'.obs;

  Future<void> launchEmailSupport() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: supportEmail.value,
      query: 'subject=Support Request',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> launchPhoneSupport() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: supportPhone.value,
    );

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> launchWhatsAppChat() async {
    final Uri whatsappUri = Uri.parse(
      'https://wa.me/${whatsappNumber.value}',
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }
}