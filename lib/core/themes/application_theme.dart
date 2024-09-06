import 'package:flutter/material.dart';
import 'package:todo/core/constants/application_colors.dart';

class ApplicationTheme {
  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: ApplicationColors.amber,
    ),
    inputDecorationTheme: _generateInputDecorationTheme(),
    useMaterial3: true,
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: ApplicationColors.amber,
    ),
    inputDecorationTheme: _generateInputDecorationTheme(),
    useMaterial3: true,
  );

  static InputDecorationTheme _generateInputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      filled: true,
    );
  }
}
