import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
  List<Task> tasksList = ObservableList<Task>();
}
