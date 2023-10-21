class InsightsModel {
  InsightsModel({
    required this.imagePath,
    required this.message,
  });

  final String imagePath;
  final String message;
}

List<InsightsModel> insights = [
  InsightsModel(imagePath: 'imagePath', message: 'Best Product of the week'),
  InsightsModel(imagePath: 'imagePath', message: 'Second best product of the week'),
];
