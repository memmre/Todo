import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/core/constants/application_colors.dart';
import 'package:todo/core/extensions/media_query_extension.dart';
import 'package:todo/features/todo/models/todo.dart';
import 'package:todo/features/todo/models/todo_filter.dart';
import 'package:todo/features/todo/view_models/todo_list_view_model.dart';

part 'package:todo/features/todo/views/components/_todo_list_item.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Todo> todos = ref.watch(filteredTodoListProvider);
    return todos.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.inbox,
                size: context.fourthOfScreenWidth,
              ),
              SizedBox(height: context.largeValue),
              const Text('There is nothing to display.'),
            ],
          )
        : ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) => _TodoListItem(
              seperator: index < todos.length - 1,
              todo: todos[index],
            ),
          );
  }
}
