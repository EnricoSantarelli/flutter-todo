// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_flutter/app/helpers/enums/status_enum.dart';

class Task {
  final String id;
  final String title;
  final String? description;
  final int difficulty;
  final IconData icon;
  final StatusEnum status;
  final DateTime createdAt;

  Task(
      {this.description,
      required this.title,
      required this.difficulty,
      required this.icon,
      required this.status,
      required this.id,
      required this.createdAt});

  Task copyWith(
      {String? description,
      String? title,
      int? difficulty,
      IconData? icon,
      StatusEnum? status,
      String? id,
      DateTime? createdAt}) {
    return Task(
        description: description ?? this.description,
        title: title ?? this.title,
        difficulty: difficulty ?? this.difficulty,
        icon: icon ?? this.icon,
        status: status ?? this.status,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'icon': icon.codePoint,
      'status': status.enumName,
      'createadAt': createdAt.toString()
    };
  }

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      difficulty: map["difficulty"],
      createdAt: DateTime.parse(map["createadAt"]),
      icon: IconData(map["icon"], fontFamily: 'MaterialIcons'),
      id: map["id"],
      status: StatusEnumExtension.fromString(map["status"]),
      title: map["title"],
      description: map["description"],
    );
  }

  static List<Task> fromMaps(List<Map<String, dynamic>> maps) {
    return maps.map((map) => Task.fromMap(map)).toList();
  }
}
