import 'package:sqflite/sqflite.dart';
import 'package:todo/core/helpers/sqflite_helper.dart';
import 'package:todo/features/todo/models/todo.dart';
import 'package:todo/features/todo/services/todo_service.dart';

class SQFLiteTodoService implements TodoService {
  final String _tableName = 'todos';

  @override
  Future<void> delete(String id) async {
    final Database database = await SQFLiteHelper.instance.database;
    await database.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<List<Todo>> fetch() async {
    final Database database = await SQFLiteHelper.instance.database;
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    return result.map((map) => Todo.fromMap(map)).toList();
  }

  @override
  Future<void> insert(Todo todo) async {
    final Database database = await SQFLiteHelper.instance.database;
    await database.insert(
      _tableName,
      todo.toMap(),
    );
  }

  @override
  Future<void> update(Todo todo) async {
    final Database database = await SQFLiteHelper.instance.database;
    await database.update(
      _tableName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}
