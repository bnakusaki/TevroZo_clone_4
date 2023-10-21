import 'package:flutter/material.dart';

class AuthTextField {
  AuthTextField({
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });

  final IconData prefixIcon;
  final String hintText;
  final IconData? suffixIcon;
}
