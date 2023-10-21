import 'package:tevrozo_clone_four/assets.dart';

class FederatedAuthButtonModel {
  FederatedAuthButtonModel({
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  final String imagePath;
  final String label;
  final Function() onPressed;
}

final List<FederatedAuthButtonModel> federatedAuthButtons = [
  FederatedAuthButtonModel(imagePath: ImagePaths.appleLogo, label: 'Apple', onPressed: () {}),
  FederatedAuthButtonModel(imagePath: ImagePaths.googleLogo, label: 'Google', onPressed: () {}),
];
