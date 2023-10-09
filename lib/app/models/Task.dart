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

  Task(
      {this.description,
      required this.title,
      required this.difficulty,
      required this.icon,
      required this.status,
      required this.id});
}
