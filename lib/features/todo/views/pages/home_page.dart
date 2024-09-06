import 'package:flutter/material.dart';
import 'package:todo/core/constants/application_strings.dart';
import 'package:todo/core/extensions/media_query_extension.dart';
import 'package:todo/core/extensions/padding_extension.dart';
import 'package:todo/features/todo/views/widgets/application_drawer.dart';
import 'package:todo/features/todo/views/widgets/filter_bar.dart';
import 'package:todo/features/todo/views/widgets/new_todo_field.dart';
import 'package:todo/features/todo/views/widgets/todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(ApplicationStrings.applicationName)),
      drawer: const ApplicationDrawer(),
      body: Padding(
        padding: context.largePadding,
        child: Column(
          children: [
            const NewTodoField(),
            SizedBox(height: context.mediumValue),
            const FilterBar(),
            SizedBox(height: context.mediumValue),
            const Expanded(
              child: TodoList(),
            ),
          ],
        ),
      ),
    );
  }
}
