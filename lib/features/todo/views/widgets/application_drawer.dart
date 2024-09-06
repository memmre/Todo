import 'package:flutter/material.dart';
import 'package:todo/core/constants/application_strings.dart';
import 'package:todo/core/extensions/media_query_extension.dart';
import 'package:todo/core/extensions/navigator_extension.dart';
import 'package:todo/features/settings/views/pages/about_page.dart';
import 'package:todo/features/settings/views/pages/settings_page.dart';
import 'package:todo/features/todo/views/components/application_logo.dart';

class ApplicationDrawer extends StatelessWidget {
  const ApplicationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Column(
        children: [
          SizedBox(
            height: context.thirdOfScreenHeight,
            child: const Center(
              child: ApplicationLogo(),
            ),
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(ApplicationStrings.settings),
            onTap: () => context.push(const SettingsPage()),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(ApplicationStrings.about),
            onTap: () => context.push(const AboutPage()),
          ),
          SizedBox(height: context.largeValue),
        ],
      ),
    );
  }
}
