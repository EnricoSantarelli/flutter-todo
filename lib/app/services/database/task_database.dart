import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TaskDatabase {
  TaskDatabase._();

  static TaskDatabase? _instance;
  static Database? _db;

  static TaskDatabase get instance {
    _instance ??= TaskDatabase._();

    return _instance!;
  }

  Future<Database> get db async {
    _db ??= await initDatabase();

    return _db!;
  }

  Future<Database> initDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), 'task_database.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE tasks(id TEXT PRIMARY KEY, title TEXT, description TEXT, difficulty INTEGER, icon INTEGER, status TEXT, createadAt TEXT)');
    }, version: 1);
  }
}
