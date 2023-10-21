import 'package:flutter/material.dart';

LinearGradient purplePinkGradient(BuildContext context, {double? ratio1, double? ratio2}) {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Theme.of(context).colorScheme.primary, Colors.pink],
    stops: [ratio1 ?? 0.05, ratio2 ?? 0.90],
  );
}
