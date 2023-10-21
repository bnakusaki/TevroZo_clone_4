import 'package:flutter/material.dart';
import 'package:tevrozo_clone_four/screens/home_screen/insights_model.dart';

class InsightCard extends StatelessWidget {
  const InsightCard({
    super.key,
    required this.insight,
  });

  final InsightsModel insight;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return ShaderMask(
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [color.primary, color.onPrimary, color.primary],
          stops: const [0.0, 0.25, 0.75],
        ).createShader(bounds);
      },
      child: Container(
        height: 250,
        width: 300,
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(insight.imagePath),
          ),
        ),
        child: Text(
          insight.message,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: color.onPrimary,
              ),
        ),
      ),
    );
  }
}
