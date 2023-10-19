// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_flutter/app/models/Task.dart';

class DashboardPageState {
  const DashboardPageState();
}

class DashboardPageInitialState extends DashboardPageState {}

class DashboardPageLoadingState extends DashboardPageState {}

class DashboardPageLoadedState extends DashboardPageState {
  List<Task> tasksList;

  DashboardPageLoadedState({
    required this.tasksList,
  });
}

class DashboardPageErrorState extends DashboardPageState {}
