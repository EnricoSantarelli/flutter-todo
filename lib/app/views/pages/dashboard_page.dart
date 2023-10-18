import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/app/controllers/tasks_store.dart';
import 'package:todo_flutter/app/helpers/colors/app_colors.dart';
import 'package:todo_flutter/app/helpers/enums/status_enum.dart';
import 'package:todo_flutter/app/helpers/utils/string_helper.dart';
import 'package:todo_flutter/app/models/Task.dart';
import 'package:todo_flutter/app/views/widgets/app_bar_widget.dart';
import 'package:todo_flutter/app/views/widgets/task_creation_sheet_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TasksStore>(context, listen: false);

    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
              return const TaskCreationSheetWidget();
            }),
        child: const Icon(Icons.add),
      ),
      body: Column(children: [
        Expanded(
          child: Observer(builder: (context) {
            return RefreshIndicator(
              onRefresh: () => store.getAllTasks(),
              child: ListView.builder(
                itemCount: store.tasksList.length,
                itemBuilder: (context, index) {
                  Task task = store.tasksList[index];
                  String differenceBetweenDates = "";
                  if (DateTime.now().difference(task.createdAt).inSeconds !=
                      0) {
                    differenceBetweenDates =
                        "${DateTime.now().difference(task.createdAt).inSeconds} seconds ago";
                  }
                  if (DateTime.now().difference(task.createdAt).inMinutes !=
                      0) {
                    differenceBetweenDates =
                        "${DateTime.now().difference(task.createdAt).inMinutes} minutes ago";
                  }
                  if (DateTime.now().difference(task.createdAt).inHours != 0) {
                    differenceBetweenDates =
                        "${DateTime.now().difference(task.createdAt).inHours} hours ago";
                  }
                  if (DateTime.now().difference(task.createdAt).inDays != 0) {
                    differenceBetweenDates =
                        "${DateTime.now().difference(task.createdAt).inDays} days ago";
                  }
                  return Stack(
                    children: [
                      Material(
                        elevation: 4,
                        child: Dismissible(
                          key: Key(task.id),
                          onDismissed: (direction) {
                            store.deleteTask(task.id);
                          },
                          background: Container(
                            decoration: BoxDecoration(color: AppColors.red),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.delete_forever_rounded,
                                    color: AppColors.white,
                                  )),
                            ),
                          ),
                          direction: DismissDirection.startToEnd,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 16,
                                  bottom: 2,
                                  child: Text(task.status.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 10))),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: ExpansionTile(
                                  trailing: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(Icons.star,
                                          size: 48,
                                          color: AppColors.getColorByDifficulty(
                                              task.difficulty)),
                                      Text(
                                        task.difficulty.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(fontSize: 16),
                                      )
                                    ],
                                  ),
                                  leading: Icon(
                                    task.icon,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                  iconColor: AppColors.getColorByDifficulty(
                                      task.difficulty),
                                  title: Text(
                                      StringHelper.capitalize(task.title),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground)),
                                  subtitle: Text(differenceBetweenDates,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground)),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              task.description ??
                                                  "No description",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onBackground)),
                                          const Spacer(),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                                value: task.status,
                                                items: StatusEnum.values
                                                    .map((StatusEnum status) {
                                                  return DropdownMenuItem(
                                                      value: status,
                                                      child: Text(status.name,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleSmall!
                                                              .copyWith(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .onBackground)));
                                                }).toList(),
                                                onChanged: ((value) {
                                                  store.changeTaskStatus(
                                                      task, value!);
                                                })),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }),
        ),
      ]),
    ));
  }
}
