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
