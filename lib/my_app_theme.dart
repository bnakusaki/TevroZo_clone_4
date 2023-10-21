import 'package:flutter/material.dart';
import 'package:tevrozo_clone_four/shared/size_config.dart';

@immutable
class MyAppTheme {
  const MyAppTheme({
    this.seedColor = const Color.fromARGB(255, 100, 59, 234),
    required this.context,
  });

  final Color seedColor;
  final BuildContext context;

  ColorScheme _colorScheme() {
    return ColorScheme.fromSeed(
      seedColor: seedColor,
      secondary: const Color.fromARGB(255, 158, 163, 174),
      surfaceVariant: const Color.fromARGB(255, 248, 249, 252),
      background: const Color.fromARGB(255, 255, 255, 255),
      onSurfaceVariant: const Color.fromARGB(255, 158, 163, 174),
    );
  }

  ThemeData _base(ColorScheme colorScheme, TextTheme textTheme) {
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      colorScheme: _colorScheme(),

      /// InputDecorations, for text form fields.
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        hintStyle: TextStyle(color: colorScheme.secondary),
        contentPadding: const EdgeInsets.all(8.0),
        filled: true,
        constraints: BoxConstraints(maxHeight: SizeConfig(context).blockSizeHorizontal() * 15.4),
      ),

      /// FilledButton theme.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: const StadiumBorder(),
          fixedSize: Size(double.maxFinite, SizeConfig(context).blockSizeVertical() * 6),
        ),
      ),

      /// OutlinedButton theme.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          fixedSize: Size(150, SizeConfig(context).blockSizeVertical() * 6),
          foregroundColor: colorScheme.scrim,
        ),
      ),
      chipTheme: const ChipThemeData(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      ),
      cardTheme: CardTheme(
        color: colorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: const CircleBorder(),
          elevation: 0.0,
          backgroundColor: colorScheme.primary.withOpacity(0.1),
          sizeConstraints: const BoxConstraints(
            minHeight: 45,
            minWidth: 45,
          )),
    );
  }

  TextTheme _textTheme() {
    return const TextTheme(
      labelLarge: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  ThemeData toThemeData() {
    final colorScheme = _colorScheme();
    final textTheme = _textTheme();
    return _base(colorScheme, textTheme);
  }
}
