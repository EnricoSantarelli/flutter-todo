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
  }

  @observable
  String? title;

  @action
  void setTitle(String value) {
    title = value;
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
  void setDifficulty(int value) {
    difficulty = value;
    starsColor = List.generate(5, (index) => ThemeData().iconTheme.color!);

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
  }

  @observable
  List<Color> starsColor =
      List.generate(5, (index) => ThemeData().iconTheme.color!);

  @observable
  List<Task> tasksList = ObservableList<Task>();
}
