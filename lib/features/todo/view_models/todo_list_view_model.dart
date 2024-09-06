import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/todo/models/todo.dart';
import 'package:todo/features/todo/services/todo_service.dart';
import 'package:uuid/uuid.dart';

final todoListProvider = StateNotifierProvider<TodoListViewModel, List<Todo>>(
  (ref) => TodoListViewModel(ref.watch(todoServiceProvider)),
);

class TodoListViewModel extends StateNotifier<List<Todo>> {
  final TodoService _todoService;

  TodoListViewModel(this._todoService) : super([]) {
    _fetch();
  }

  Future<void> add(String title) async {
    final Todo todo = Todo(id: const Uuid().v4(), title: title);
    state = [...state, todo];
    await _todoService.insert(todo);
  }

  Future<void> delete(String id) async {
    state = state.where((todo) => todo.id != id).toList();
    await _todoService.delete(id);
  }

  Future<void> toggle(String id) async {
    final updatedTodos = state.map((todo) {
      if (todo.id == id) {
        final Todo updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted);
        _todoService.update(updatedTodo);
        return updatedTodo;
      }
      return todo;
    }).toList();

    state = updatedTodos;
  }

  Future<void> _fetch() async {
    final List<Todo> todos = await _todoService.fetch();
    state = todos;
  }
}
