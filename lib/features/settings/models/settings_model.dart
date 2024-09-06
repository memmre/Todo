import 'package:flutter/material.dart';

class SettingsModel {
  final Locale locale;
  final ThemeData theme;

  SettingsModel({
    required this.locale,
    required this.theme,
  });

  SettingsModel copyWith({
    Locale? locale,
    ThemeData? theme,
  }) {
    return SettingsModel(
      locale: locale ?? this.locale,
      theme: theme ?? this.theme,
    );
  }
}
