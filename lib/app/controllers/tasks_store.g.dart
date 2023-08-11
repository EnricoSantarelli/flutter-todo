// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on TasksStoreBase, Store {
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

  late final _$tasksListAtom =
      Atom(name: 'TasksStoreBase.tasksList', context: context);

  @override
  List<Task> get tasksList {
    _$tasksListAtom.reportRead();
    return super.tasksList;
  }

  @override
  set tasksList(List<Task> value) {
    _$tasksListAtom.reportWrite(value, super.tasksList, () {
      super.tasksList = value;
    });
  }

  late final _$TasksStoreBaseActionController =
      ActionController(name: 'TasksStoreBase', context: context);

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
  String toString() {
    return '''
icon: ${icon},
title: ${title},
description: ${description},
tasksList: ${tasksList}
    ''';
  }
}
