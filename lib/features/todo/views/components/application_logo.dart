import 'package:flutter/material.dart';
import 'package:todo/core/constants/application_strings.dart';
import 'package:todo/core/extensions/media_query_extension.dart';
import 'package:todo/core/extensions/theme_extension.dart';

class ApplicationLogo extends StatelessWidget {
  const ApplicationLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Icon(
        Icons.done_rounded,
        size: context.eighthOfScreenHeight,
      ),
      subtitle: IntrinsicHeight(
        child: Center(
          child: Text(
            ApplicationStrings.applicationName,
            style: context.textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
