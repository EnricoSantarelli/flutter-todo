import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Hero(
                  tag: "TESTE",
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 4,
                      child: ListTile(
                        title: const Text("TEste"),
                        subtitle: const Text('Tap here for Hero transition'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<Widget>(
                                builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Scaffold(
                                  appBar: AppBar(
                                      title: const Text('ListTile Hero')),
                                  body: Center(
                                    child: Hero(
                                      tag: "TESTE",
                                      child: ListTile(
                                        title: const Text('ListTile with Hero'),
                                        subtitle:
                                            const Text('Tap here to go back'),
                                        tileColor: Colors.blue[700],
                                        onTap: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ]),
    ));
  }
}
