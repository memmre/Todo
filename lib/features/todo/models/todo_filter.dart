import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/todo/models/todo.dart';
import 'package:todo/features/todo/view_models/todo_list_view_model.dart';

enum TodoFilter {
  all,
  done,
  todo,
}

final todoFilterProvider = StateProvider<TodoFilter>(
  (ref) => TodoFilter.todo,
);

final filteredTodoListProvider = Provider<List<Todo>>(
  (ref) {
    final TodoFilter filter = ref.watch(todoFilterProvider);
    final List<Todo> todos = ref.watch(todoListProvider);

    switch (filter) {
      case TodoFilter.done:
        return todos.where((todo) => todo.isCompleted).toList();
      case TodoFilter.todo:
        return todos.where((todo) => !todo.isCompleted).toList();
      case TodoFilter.all:
      default:
        return todos;
    }
  },
);
