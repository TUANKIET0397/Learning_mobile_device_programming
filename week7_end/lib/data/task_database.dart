import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class TaskDatabase {
  TaskDatabase._();

  static final TaskDatabase instance = TaskDatabase._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final dbPath = path.join(databasesPath, 'uth_smart_tasks.db');

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE tasks('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'title TEXT NOT NULL,'
          'description TEXT NOT NULL,'
          'created_at INTEGER NOT NULL'
          ')',
        );
      },
    );
  }
}
