// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:todo_flutter/app/helpers/colors/app_colors.dart';
import 'package:todo_flutter/app/models/Task.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
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
    difficulty = value;
    starsColor =
        List.generate(5, (index) => Theme.of(context).iconTheme.color!);

    Color? color;
    Map<int, Color> colorMap = {
      1: AppColors.green,
      2: AppColors.yellow,
      3: AppColors.orange,
      4: AppColors.red,
      5: AppColors.purple
    };
    color = colorMap[value];

    starsColor.fillRange(0, value, color);

    isDifficultySet = true;
  }

  @observable
  bool isDifficultySet = true;

  @observable
  List<Color> starsColor =
      List.generate(5, (index) => ThemeData().iconTheme.color!);

  @observable
  List<Task> tasksList = ObservableList<Task>();

  @action
  void addTask(Task task) {
    tasksList.add(task);
  }
}
