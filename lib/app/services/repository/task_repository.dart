import 'package:sqflite/sqflite.dart';
import 'package:todo_flutter/app/models/Task.dart';
import 'package:todo_flutter/app/services/database/task_database.dart';

class TaskRepository {
  TaskRepository._();

  static TaskRepository? _instance;

  static get instance {
    _instance ??= TaskRepository._();

    return _instance;
  }

  Future<List<Task>> getAllTasks() async {
    Database db = await TaskDatabase.instance.db;
    List<Map<String, dynamic>> maps = await db.query('tasks');
    List<Task> tasks = Task.fromMaps(maps);

    return tasks;
  }

  Future<void> createTask(Task task) async {
    Database db = await TaskDatabase.instance.db;
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
