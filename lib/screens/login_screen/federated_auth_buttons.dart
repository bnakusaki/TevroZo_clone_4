// ignore_for_file: library_private_types_in_public_api

import 'package:tevrozo_clone_four/assets.dart';

class _FederatedAuthButtonModel {
  _FederatedAuthButtonModel({
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  final String imagePath;
  final String label;
  final Function() onPressed;
}

final List<_FederatedAuthButtonModel> federatedAuthButtons = [
  _FederatedAuthButtonModel(imagePath: ImagePaths.appleLogo, label: 'Apple', onPressed: () {}),
  _FederatedAuthButtonModel(imagePath: ImagePaths.googleLogo, label: 'Google', onPressed: () {}),
];
