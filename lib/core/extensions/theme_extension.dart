import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  Brightness get brightness => theme.brightness;

  Color get primaryColor => theme.primaryColor;

  TextTheme get textTheme => theme.textTheme;
}
