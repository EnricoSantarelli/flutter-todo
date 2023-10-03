import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/app/controllers/tasks_store.dart';

class TaskCreationSheetWidget extends StatelessWidget {
  static const iconsList = [
    Icons.audiotrack_rounded,
    Icons.done_rounded,
    Icons.local_fire_department_rounded,
    Icons.sports_soccer_rounded,
    Icons.fitness_center_rounded,
    Icons.menu_book_rounded,
    Icons.payment_rounded,
    Icons.celebration_rounded,
    Icons.people_alt_rounded,
    Icons.work_rounded
  ];

  const TaskCreationSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<TasksStore>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Form(
            child: Column(
          children: [
            Text(
              "Create your task",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 32),
            ),
            const SizedBox(height: 32),
            Text(
              'Select an icon',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: List.generate(
                  iconsList.length,
                  (index) => Observer(builder: (context) {
                        var isSelected = store.icon == iconsList[index];
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: isSelected
                                  ? Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary)
                                  : null),
                          child: IconButton(
                            onPressed: () => store.setIcon(iconsList[index]),
                            icon: Icon(iconsList[index]),
                            iconSize: isSelected ? 48 : 32,
                          ),
                        );
                      })),
            ),
            const SizedBox(height: 16),
            Text(
              'Title',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            TextFormField(
              maxLength: 20,
              onChanged: (value) => store.setTitle(value),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ))),
            ),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
            TextFormField(
              maxLines: 3,
              expands: false,
              maxLength: 100,
              onChanged: (value) => store.setTitle(value),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ))),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Difficulty: ',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                const Icon(Icons.star),
                const Icon(Icons.star),
                const Icon(Icons.star),
                const Icon(Icons.star),
                const Icon(Icons.star)
              ],
            ),
          ],
        )),
      ),
    );
  }
}
