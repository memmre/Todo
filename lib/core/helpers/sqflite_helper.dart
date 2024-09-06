import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQFLiteHelper {
  static Database? _database;
  static final SQFLiteHelper instance = SQFLiteHelper._();

  SQFLiteHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase('todos.db');
    return _database!;
  }

  Future<void> close() async {
    final Database database = await instance.database;
    database.close();
  }

  Future<Database> _initializeDatabase(String databaseName) async {
    final String databasePath = await getDatabasesPath();
    final String path = join(databasePath, databaseName);
    return await openDatabase(
      path,
      onCreate: _onDatabaseCreate,
      version: 1,
    );
  }

  Future _onDatabaseCreate(Database database, int version) async {
    await database.execute(
      '''
        CREATE TABLE todos (
          id TEXT PRIMARY KEY,
          title TEXT NOT NULL,
          isCompleted BOOLEAN NOT NULL
        )
      ''',
    );
  }
}
