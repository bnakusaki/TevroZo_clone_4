import 'package:flutter/material.dart';

@immutable
class MyAppTheme {
  const MyAppTheme({
    this.seedColor = const Color.fromARGB(255, 100, 59, 234),
  });

  final Color seedColor;

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
        constraints: const BoxConstraints(maxHeight: 50.0),
      ),

      /// FilledButton theme.
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: const StadiumBorder(),
          fixedSize: const Size(double.maxFinite, 50.0),
        ),
      ),

      /// OutlinedButton theme.
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          fixedSize: const Size(150, 50),
          foregroundColor: colorScheme.scrim,
        ),
      ),
      chipTheme: const ChipThemeData(
        shape: StadiumBorder(),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      ),
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
