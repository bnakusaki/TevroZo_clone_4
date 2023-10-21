// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class _AuthTextField {
  _AuthTextField({
    required this.prefixIcon,
    required this.hintText,
    this.suffixIcon,
  });

  final IconData prefixIcon;
  final String hintText;
  final IconData? suffixIcon;
}

final List<_AuthTextField> authTextFields = [
  _AuthTextField(
    prefixIcon: IconlyLight.message,
    hintText: 'Your Email',
    suffixIcon: null,
  ),
  _AuthTextField(
    prefixIcon: IconlyLight.lock,
    hintText: 'Your Password',
    suffixIcon: IconlyLight.hide,
  ),
];
