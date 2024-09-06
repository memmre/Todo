import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/features/todo/models/todo.dart';
import 'package:todo/features/todo/services/sqflite_todo_service.dart';

final todoServiceProvider = Provider(
  (ref) => SQFLiteTodoService(),
);

abstract class TodoService {
  Future<void> delete(String id);

  Future<List<Todo>> fetch();

  Future<void> insert(Todo todo);

  Future<void> update(Todo todo);
}
