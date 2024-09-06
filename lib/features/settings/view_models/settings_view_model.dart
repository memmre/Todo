import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/core/themes/application_theme.dart';
import 'package:todo/features/settings/models/settings_model.dart';

final settingsProvider =
    StateNotifierProvider<SettingsViewModel, SettingsModel>(
  (ref) => SettingsViewModel(),
);

class SettingsViewModel extends StateNotifier<SettingsModel> {
  SettingsViewModel()
      : super(
          SettingsModel(
            locale: const Locale('en'),
            theme: ApplicationTheme.light,
          ),
        ) {
    _loadSettings();
  }

  Future<void> updateLocale(Locale locale) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('locale', locale.languageCode);
    state = state.copyWith(locale: locale);
  }

  Future<void> updateTheme(ThemeData theme) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('theme', theme.brightness.toString());
    state = state.copyWith(theme: theme);
  }

  Future<void> _loadSettings() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    
    final Locale locale = Locale(preferences.getString('locale') ?? 'en');
    
    final String? themeCode = preferences.getString('theme');
    ThemeData theme = (themeCode == 'Brightness.dark')
        ? ApplicationTheme.dark
        : ApplicationTheme.light;
    
    state = state.copyWith(locale: locale, theme: theme);
  }
}
