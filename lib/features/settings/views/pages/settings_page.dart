import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/constants/application_strings.dart';
import 'package:todo/core/extensions/padding_extension.dart';
import 'package:todo/core/themes/application_theme.dart';
import 'package:todo/features/settings/view_models/settings_view_model.dart';

part 'package:todo/features/settings/views/components/_language_item.dart';
part 'package:todo/features/settings/views/components/_theme_item.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ApplicationStrings.settings)),
      body: Padding(
        padding: context.largePadding,
        child: ListView(
          children: const [
            _LanguageItem(),
            _ThemeItem(),
          ],
        ),
      ),
    );
  }
}
