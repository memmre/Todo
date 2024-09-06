import 'package:flutter/material.dart';
import 'package:todo/core/constants/application_strings.dart';
import 'package:todo/core/extensions/media_query_extension.dart';
import 'package:todo/features/todo/views/components/application_logo.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ApplicationStrings.about),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ApplicationLogo(),
          SizedBox(height: context.largeValue),
          const Text(ApplicationStrings.developer),
          SizedBox(height: context.largeValue),
          TextButton(
            onPressed: () => showLicensePage(context: context),
            child: Text(ApplicationStrings.showLicenses),
          ),
        ],
      ),
    );
  }
}
