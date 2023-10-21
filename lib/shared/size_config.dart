import 'package:flutter/widgets.dart';

class SizeConfig {
  SizeConfig(this.context);

  final BuildContext context;

  double blockSizeHorizontal() {
    return (MediaQuery.of(context).size.width) / 100;
  }

  double blockSizeVertical() {
    return (MediaQuery.of(context).size.height) / 100;
  }

  double get screenHorizontalPadding => blockSizeHorizontal() * 5.4;
}
