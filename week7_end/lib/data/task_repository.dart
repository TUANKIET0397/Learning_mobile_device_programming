import '../models/task.dart';
import 'task_database.dart';

class TaskRepository {
  TaskRepository({TaskDatabase? database})
    : _database = database ?? TaskDatabase.instance;

  final TaskDatabase _database;

  Future<List<Task>> getTasks() async {
    final db = await _database.database;
    final rows = await db.query('tasks', orderBy: 'created_at DESC');
    return rows.map(Task.fromMap).toList();
  }

  Future<Task> addTask(Task task) async {
    final db = await _database.database;
    final id = await db.insert('tasks', task.toMap());
    return task.copyWith(id: id);
  }

  Future<void> deleteTask(int id) async {
    final db = await _database.database;
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
