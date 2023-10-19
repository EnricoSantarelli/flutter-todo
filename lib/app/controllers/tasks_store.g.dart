// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on TasksStoreBase, Store {
  late final _$stateAtom = Atom(name: 'TasksStoreBase.state', context: context);

  @override
  DashboardPageState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DashboardPageState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$iconAtom = Atom(name: 'TasksStoreBase.icon', context: context);

  @override
  IconData? get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(IconData? value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  late final _$isIconSetAtom =
      Atom(name: 'TasksStoreBase.isIconSet', context: context);

  @override
  bool get isIconSet {
    _$isIconSetAtom.reportRead();
    return super.isIconSet;
  }

  @override
  set isIconSet(bool value) {
    _$isIconSetAtom.reportWrite(value, super.isIconSet, () {
      super.isIconSet = value;
    });
  }

  late final _$titleAtom = Atom(name: 'TasksStoreBase.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'TasksStoreBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$difficultyAtom =
      Atom(name: 'TasksStoreBase.difficulty', context: context);

  @override
  int? get difficulty {
    _$difficultyAtom.reportRead();
    return super.difficulty;
  }

  @override
  set difficulty(int? value) {
    _$difficultyAtom.reportWrite(value, super.difficulty, () {
      super.difficulty = value;
    });
  }

  late final _$isDifficultySetAtom =
      Atom(name: 'TasksStoreBase.isDifficultySet', context: context);

  @override
  bool get isDifficultySet {
    _$isDifficultySetAtom.reportRead();
    return super.isDifficultySet;
  }

  @override
  set isDifficultySet(bool value) {
    _$isDifficultySetAtom.reportWrite(value, super.isDifficultySet, () {
      super.isDifficultySet = value;
    });
  }

  late final _$starsColorAtom =
      Atom(name: 'TasksStoreBase.starsColor', context: context);

  @override
  List<Color> get starsColor {
    _$starsColorAtom.reportRead();
    return super.starsColor;
  }

  @override
  set starsColor(List<Color> value) {
    _$starsColorAtom.reportWrite(value, super.starsColor, () {
      super.starsColor = value;
    });
  }

  late final _$tasksListAtom =
      Atom(name: 'TasksStoreBase.tasksList', context: context);

  @override
  ObservableList<Task> get tasksList {
    _$tasksListAtom.reportRead();
    return super.tasksList;
  }

  @override
  set tasksList(ObservableList<Task> value) {
    _$tasksListAtom.reportWrite(value, super.tasksList, () {
      super.tasksList = value;
    });
  }

  late final _$orderbyAtom =
      Atom(name: 'TasksStoreBase.orderby', context: context);

  @override
  OrderEnum get orderby {
    _$orderbyAtom.reportRead();
    return super.orderby;
  }

  @override
  set orderby(OrderEnum value) {
    _$orderbyAtom.reportWrite(value, super.orderby, () {
      super.orderby = value;
    });
  }

  late final _$filterByStatusAtom =
      Atom(name: 'TasksStoreBase.filterByStatus', context: context);

  @override
  StatusEnum get filterByStatus {
    _$filterByStatusAtom.reportRead();
    return super.filterByStatus;
  }

  @override
  set filterByStatus(StatusEnum value) {
    _$filterByStatusAtom.reportWrite(value, super.filterByStatus, () {
      super.filterByStatus = value;
    });
  }

  late final _$filterByDifficultyAtom =
      Atom(name: 'TasksStoreBase.filterByDifficulty', context: context);

  @override
  RangeValues get filterByDifficulty {
    _$filterByDifficultyAtom.reportRead();
    return super.filterByDifficulty;
  }

  @override
  set filterByDifficulty(RangeValues value) {
    _$filterByDifficultyAtom.reportWrite(value, super.filterByDifficulty, () {
      super.filterByDifficulty = value;
    });
  }

  late final _$createTaskAsyncAction =
      AsyncAction('TasksStoreBase.createTask', context: context);

  @override
  Future<void> createTask(Task task) {
    return _$createTaskAsyncAction.run(() => super.createTask(task));
  }

  late final _$getAllTasksAsyncAction =
      AsyncAction('TasksStoreBase.getAllTasks', context: context);

  @override
  Future<void> getAllTasks() {
    return _$getAllTasksAsyncAction.run(() => super.getAllTasks());
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('TasksStoreBase.deleteTask', context: context);

  @override
  Future<void> deleteTask(String id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(id));
  }

  late final _$changeTaskStatusAsyncAction =
      AsyncAction('TasksStoreBase.changeTaskStatus', context: context);

  @override
  Future<void> changeTaskStatus(Task task, StatusEnum status) {
    return _$changeTaskStatusAsyncAction
        .run(() => super.changeTaskStatus(task, status));
  }

  late final _$TasksStoreBaseActionController =
      ActionController(name: 'TasksStoreBase', context: context);

  @override
  void changeState(DashboardPageState value) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.changeState');
    try {
      return super.changeState(value);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIcon(IconData value) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.setIcon');
    try {
      return super.setIcon(value);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateTitle(String? value) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.validateTitle');
    try {
      return super.validateTitle(value);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDifficulty(int value, BuildContext context) {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.setDifficulty');
    try {
      return super.setDifficulty(value, context);
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterTasksList() {
    final _$actionInfo = _$TasksStoreBaseActionController.startAction(
        name: 'TasksStoreBase.filterTasksList');
    try {
      return super.filterTasksList();
    } finally {
      _$TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
icon: ${icon},
isIconSet: ${isIconSet},
title: ${title},
description: ${description},
difficulty: ${difficulty},
isDifficultySet: ${isDifficultySet},
starsColor: ${starsColor},
tasksList: ${tasksList},
orderby: ${orderby},
filterByStatus: ${filterByStatus},
filterByDifficulty: ${filterByDifficulty}
    ''';
  }
}
