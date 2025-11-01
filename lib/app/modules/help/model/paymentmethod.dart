import 'package:flutter/material.dart';

class PaymentMethod {
  final String name;
  final String expires;
  final IconData icon;

  PaymentMethod({
    required this.name,
    required this.expires,
    required this.icon,
  });
}
