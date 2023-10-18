import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/app/controllers/tasks_store.dart';
import 'package:todo_flutter/app/helpers/enums/status_enum.dart';
import 'package:todo_flutter/app/models/Task.dart';
import 'package:todo_flutter/app/views/animation/blinking_difficulty_animation.dart';
import 'package:todo_flutter/app/views/animation/blinking_icon_animation.dart';
import 'package:todo_flutter/app/views/widgets/app_bar_widget.dart';
import 'package:todo_flutter/app/views/widgets/button_widget.dart';
import 'package:uuid/uuid.dart';

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
    final formKey = GlobalKey<FormState>();

    // reset the form when rebuild the sheet
    store.starsColor =
        List.generate(5, (index) => Theme.of(context).iconTheme.color!);
    store.isDifficultySet = true;
    store.isIconSet = true;
    store.icon = null;
    store.difficulty = null;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarWidget(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  "Create your task",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 32),
                ),
                const SizedBox(height: 16),
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
                                child: store.isIconSet
                                    ? IconButton(
                                        onPressed: () =>
                                            store.setIcon(iconsList[index]),
                                        icon: Icon(iconsList[index]),
                                        iconSize: isSelected ? 48 : 32)
                                    : BlinkingIconAnimation(
                                        onPressed: () =>
                                            store.setIcon(iconsList[index]),
                                        icon: iconsList[index],
                                        size: isSelected ? 48 : 32));
                          })),
                ),
                Observer(builder: (context) {
                  return store.isIconSet == false
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            // similar to default error style
                            padding: const EdgeInsets.fromLTRB(12.2, 2, 0, 0),
                            child: Text(
                              'Select an icon',
                              style: TextStyle(
                                  color: ThemeData().colorScheme.error,
                                  fontSize: 11.5),
                            ),
                          ))
                      : const SizedBox.shrink();
                }),
                const SizedBox(height: 16),
                Text(
                  'Title',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                ),
                TextFormField(
                  validator: (value) => store.validateTitle(value),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLength: 20,
                  onChanged: (value) => store.setTitle(value),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.tertiary,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ))),
                ),
                const SizedBox(height: 8),
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
                      fillColor: Theme.of(context).colorScheme.tertiary,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ))),
                ),
                const SizedBox(height: 8),
                Observer(builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Difficulty: ',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return store.isDifficultySet
                              ? IconButton(
                                  onPressed: () =>
                                      store.setDifficulty(index + 1, context),
                                  icon: Icon(
                                    Icons.star,
                                    color: store.starsColor[index],
                                  ),
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                )
                              : BlinkingDifficultyAnimation(
                                  onPressed: () =>
                                      store.setDifficulty(index + 1, context),
                                  color: store.starsColor[index]);
                        }),
                      )
                    ],
                  );
                }),
                Observer(builder: (context) {
                  return store.isDifficultySet == false
                      ? Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            // similar to default error style
                            padding: const EdgeInsets.fromLTRB(0, 2, 12.2, 0),
                            child: Text(
                              'Select an difficulty',
                              style: TextStyle(
                                  color: ThemeData().colorScheme.error,
                                  fontSize: 11.5),
                            ),
                          ))
                      : const SizedBox.shrink();
                }),
                const SizedBox(height: 32),
                ButtonWidget(
                    onPressed: () {
                      if (store.difficulty == null) {
                        store.isDifficultySet = false;
                      }
                      if (store.icon == null) {
                        store.isIconSet = false;
                      }
                      if (formKey.currentState!.validate() &&
                          store.isIconSet &&
                          store.isDifficultySet) {
                        store.createTask(Task(
                            createdAt: DateTime.now()
                                .subtract(const Duration(seconds: 1)),
                            id: const Uuid().v4(),
                            difficulty: store.difficulty!,
                            icon: store.icon!,
                            title: store.title!,
                            status: StatusEnum.TO_DO,
                            description: store.description));
                        Navigator.of(context).pop();
                      }
                    },
                    title: 'Create',
                    icon: Icons.add),
              ],
            )),
      ),
    );
  }
}
