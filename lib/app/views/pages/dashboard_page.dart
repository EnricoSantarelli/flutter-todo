import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/app/controllers/tasks_store.dart';
import 'package:todo_flutter/app/views/widgets/app_bar_widget.dart';
import 'package:todo_flutter/app/views/widgets/task_creation_sheet_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TasksStore>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(
            title: "To-Do List",
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            enableDrag: false,
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (_) {
              return TaskCreationSheetWidget();
            }),
        child: const Icon(Icons.add),
      ),
    ));
  }
}
