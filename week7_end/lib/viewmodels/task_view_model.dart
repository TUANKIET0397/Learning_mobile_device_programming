import 'package:flutter/foundation.dart';

import '../data/task_repository.dart';
import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  TaskViewModel({TaskRepository? repository})
    : _repository = repository ?? TaskRepository() {
    _loadTasks();
  }

  final TaskRepository _repository;

  final List<Task> _tasks = [];
  bool _isLoading = false;

  List<Task> get tasks => List.unmodifiable(_tasks);
  bool get isLoading => _isLoading;

  Future<void> _loadTasks() async {
    _isLoading = true;
    notifyListeners();
    final data = await _repository.getTasks();
    _tasks
      ..clear()
      ..addAll(data);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTask({
    required String title,
    required String description,
  }) async {
    if (title.trim().isEmpty) {
      return;
    }
    final task = Task(
      title: title.trim(),
      description: description.trim(),
      createdAt: DateTime.now(),
    );
    final saved = await _repository.addTask(task);
    _tasks.insert(0, saved);
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    final id = task.id;
    if (id == null) {
      return;
    }
    await _repository.deleteTask(id);
    _tasks.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
