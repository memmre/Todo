import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/constants/application_colors.dart';
import 'package:todo/core/constants/application_strings.dart';
import 'package:todo/features/todo/models/todo_filter.dart';

part 'package:todo/features/todo/views/components/_filter_bar_item.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _FilterBarItem(
            filter: TodoFilter.todo,
            text: ApplicationStrings.todo,
          ),
        ),
        Expanded(
          child: _FilterBarItem(
            filter: TodoFilter.done,
            text: ApplicationStrings.done,
          ),
        ),
        Expanded(
          child: _FilterBarItem(
            filter: TodoFilter.all,
            text: ApplicationStrings.all,
          ),
        ),
      ],
    );
  }
}
