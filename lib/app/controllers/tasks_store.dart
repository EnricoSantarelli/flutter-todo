import 'package:mobx/mobx.dart';

part 'tasks_store.g.dart';

class TasksStore = TasksStoreBase with _$TasksStore;

abstract class TasksStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
