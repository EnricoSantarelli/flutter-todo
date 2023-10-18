// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:todo_flutter/app/helpers/colors/app_colors.dart';
import 'package:todo_flutter/app/helpers/enums/status_enum.dart';
import 'package:todo_flutter/app/models/Task.dart';
import 'package:todo_flutter/app/services/repository/task_repository.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  final TaskRepository _repository = TaskRepository.instance;

  TasksStoreBase() {
    getAllTasks();
  }

  @observable
  IconData? icon;

  @action
  void setIcon(IconData value) {
    icon = value;
    isIconSet = true;
  }

  @observable
  bool isIconSet = true;

  @observable
  String? title;

  @action
  void setTitle(String value) {
    title = value;
  }

  @action
  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a title";
    }
    return null;
  }

  @observable
  String? description;

  @action
  void setDescription(String value) {
    description = value;
  }

  @observable
  int? difficulty;

  @action
  void setDifficulty(int value, BuildContext context) {
    starsColor =
        List.generate(5, (index) => Theme.of(context).iconTheme.color!);

    starsColor.fillRange(0, value, AppColors.getColorByDifficulty(value));

    difficulty = value;
    isDifficultySet = true;
  }

  @observable
  bool isDifficultySet = true;

  @observable
  List<Color> starsColor =
      List.generate(5, (index) => ThemeData().iconTheme.color!);

  @observable
  ObservableList<Task> tasksList = ObservableList<Task>();

  @action
  Future<void> createTask(Task task) async {
    await _repository.createTask(task);
    tasksList.add(task);
  }

  @action
  Future<void> getAllTasks() async {
    List<Task> auxiliarList = await _repository.getAllTasks();
    tasksList = ObservableList<Task>.of(auxiliarList);
  }

  @action
  Future<void> deleteTask(String id) async {
    await _repository.deleteTask(id);
    tasksList.removeWhere((element) => element.id == id);
  }

  @action
  Future<void> changeTaskStatus(Task task, StatusEnum status) async {
    int index = tasksList.indexOf(task);

    tasksList[index] = tasksList[index].copyWith(status: status);
    await _repository.updateTask(tasksList[index]);
  }
}
